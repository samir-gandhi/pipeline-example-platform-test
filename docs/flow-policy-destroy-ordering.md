# Best practices: promoting flows behind application flow policies

These guidelines describe how to manage the lifecycle of DaVinci flows
that are distributed through application flow policies, using the
PingOne Terraform provider. They explain a Terraform ordering pitfall
that surfaces as a `CONSTRAINT_VIOLATION` during `terraform apply`,
when to expect it, and how to structure your promotion workflow around
it. These guidelines are not intended to educate on the general use of
Terraform or the provider's day-to-day workflow.

## Replacing a flow that is distributed by an application flow policy

An application flow policy distributes one or more DaVinci flows to an
application's sign-on experience. Replacing the distributed flow — for
example, moving from a flow that renders inline HTML template nodes to
one that renders the environment's PingOne forms — is the most common
way to encounter this pitfall.

Consider a module that ships a sign-on experience using three
resources:

```terraform
resource "pingone_davinci_flow" "sign_on_flow_v1" {
  ...
}

resource "pingone_davinci_application_flow_policy" "sign_on_policy" {
  ...
  flow_distributions = [
    {
      id      = pingone_davinci_flow.sign_on_flow_v1.id
      version = -1
      weight  = 100
    }
  ]
}

resource "pingone_application_flow_policy_assignment" "portal" {
  ...
  flow_policy_id = pingone_davinci_application_flow_policy.sign_on_policy.id
}
```

The next module version replaces the flow with a form-based
experience. The change removes the old flow resource and repoints the
policy in the same apply:

```terraform
resource "pingone_davinci_flow" "sign_on_flow_v2" {
  ...
}

resource "pingone_davinci_application_flow_policy" "sign_on_policy" {
  ...
  flow_distributions = [
    {
      id      = pingone_davinci_flow.sign_on_flow_v2.id
      version = -1
      weight  = 100
    }
  ]
}

# pingone_davinci_flow.sign_on_flow_v1 is no longer in configuration,
# so Terraform plans its destroy.
```

One `terraform apply` plans a create, an update, and a destroy. The
destroy can fail with:

```
Error when calling `DeleteFlowById`
Code:     CONSTRAINT_VIOLATION
Message:  This Flow is in a Application Flow Policy
```

## Why the destroy can fail

Terraform sequences work using edges derived from the current
configuration only. Two edges exist in this apply:

- The policy references `pingone_davinci_flow.sign_on_flow_v2.id`, so
  Terraform creates the new flow before updating the policy.
- The policy no longer references `sign_on_flow_v1`. Because the
  removed resource contributes no configuration, **no edge can exist
  between the policy update and the old flow's destroy** — a destroyed
  resource carries no config to attach a dependency to.

With no edge between them, Terraform treats the policy update and the
flow destroy as independent and may run them in parallel. If the flow
destroy reaches the PingOne API while the policy still references the
flow, the request is rejected with `CONSTRAINT_VIOLATION`, the apply
errors, and the flow remains in state.

The dependency required here is *do not destroy the old flow until the
policy stops referencing it* — but the policy stops referencing it as a
consequence of an update performed in the same apply. Terraform's graph
cannot express destroy-after-unrelated-update: `depends_on` and direct
references only create edges for resources present in configuration,
and `create_before_destroy` applies to replacement, not removal.

## Not best practice

Relying on apply ordering that Terraform does not guarantee:

```terraform
# Removing the flow and repointing the policy in one apply and hoping
# the destroy runs after the update. No edge exists between them, so
# the API may reject the destroy mid-apply.
```

## Best practice

Ping Identity recommends structuring the promotion so the apply tolerates
the two-phase transition, or phasing the removal across applies.

Retry the apply once in the pipeline. The failure is deterministically
self-healing: the first apply updates the policy and removes the
reference, so the second apply's destroy finds no constraint.

```terraform
# .github/workflows/push.yml (Deploy job)
terraform -chdir="${_tfdir}" apply --auto-approve -input=false || {
  echo "First apply failed; retrying to settle flow-policy destroy ordering..."
  terraform -chdir="${_tfdir}" apply --auto-approve -input=false
}
```

Alternatively, phase the removal: merge the policy repoint first, then
remove the superseded flow resources in a subsequent change. This is the
right shape when a human reviews each step, at the cost of an extra
promotion cycle.

Keeping the superseded flow in configuration for one release as an
unreferenced resource is also workable, but it retains dead
configuration in the module for its lifetime. Ping Identity recommends
the retry approach for pipelines, and the phased removal where
apply-time human review is part of the workflow.

## When a second apply is required

| Operation | Applies | Why |
|---|---|---|
| Create an environment from no state | 1 | Nothing old exists. Terraform orders flow create → policy create, and no old flow can be policy-referenced. |
| Destroy an environment | 1 | The edge exists in reverse: Terraform destroys the policy before the flows it references, so the constraint cannot trigger. |
| Replace a distributed flow in an existing environment | 2 | The policy update and the old flow's destroy run in the same apply with no edge between them. The first apply settles the policy; the second completes the destroy. |

The third row is a **one-time migration cost per environment**, not a
recurring one: once every environment consumes the new module version,
all future applies — creation, feature work, promotion, teardown — are
single-apply, and the retry becomes a silent no-op.

## Related considerations

- The same pattern applies to any resource that is removed while a
  third-party reference to it is repointed in the same apply: policy
  distributions, application assignments, grants. Expect a possible
  `CONSTRAINT_VIOLATION` on the removal and plan for one retry, or
  split the reference change and the removal across applies.
- DaVinci flows that remain deployed but are no longer distributed by
  any policy are inert. Removing them promptly keeps environments clean
  and avoids confusion in the admin console.
- If the provider later models flow-policy membership with internal
  replacement semantics, the retry may become unnecessary. Check the
  provider changelog when upgrading.
