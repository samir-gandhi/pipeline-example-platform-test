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

Simply retrying the failed apply is also not sufficient — see
"Why a plain retry does not work" below.

## Why a plain retry does not work

An obvious mitigation — rerun the apply after it fails — does **not**
work, and it is worth understanding why. The policy update is gated
behind the new flow's create (the one edge the graph does have), and a
flow create is slow. The old flow's destroy is fast-failing and runs in
parallel. Every attempt follows the same trajectory: the destroy
reaches the API first, is refused, the apply aborts, and the policy
update never lands. Repeating the same plan repeats the same race.

## Best practice

Ping Identity recommends settling the policy before the destroys run:
detect the pattern in the plan (an application flow policy change plus
a flow destroy), and apply the policy chain first with `-target`. The
new flow is created and the policy repointed while the old flow stays
deployed; the full apply afterwards destroys the old flow with no
reference left behind.

```sh
# 1. Targeted pre-apply: create the new flow, repoint the policy.
terraform apply -auto-approve \
  -target=pingone_davinci_flow.sign_on_flow_v2 \
  -target=pingone_davinci_application_flow_policy.sign_on_policy

# 2. Full apply: the old flow is now unreferenced; destroy succeeds.
terraform apply -auto-approve
```

In a pipeline, gate the pre-apply on the plan content so it only runs
during the one-time migration:

```sh
terraform plan -no-color -out=/dev/null > plan.txt
if grep -q "pingone_davinci_application_flow_policy" plan.txt \
   && grep -qE "pingone_davinci_flow[^ ]* will be destroyed" plan.txt; then
  terraform apply -auto-approve \
    -target=pingone_davinci_flow.sign_on_flow_v2 \
    -target=pingone_davinci_application_flow_policy.sign_on_policy
fi
terraform apply -auto-approve
```

Alternatively, phase the removal manually: merge the policy repoint
first, then remove the superseded flow resources in a subsequent
change. This is the right shape when a human reviews each step, at the
cost of an extra promotion cycle.

Keeping the superseded flow in configuration for one release as an
unreferenced resource is also workable, but it retains dead
configuration in the module for its lifetime. Ping Identity recommends
the targeted pre-apply for pipelines, and the phased removal where
apply-time human review is part of the workflow.

## When a second apply is required

| Operation | Applies | Why |
|---|---|---|
| Create an environment from no state | 1 | Nothing old exists. Terraform orders flow create → policy create, and no old flow can be policy-referenced. |
| Destroy an environment | 1 | The edge exists in reverse: Terraform destroys the policy before the flows it references, so the constraint cannot trigger. |
| Replace a distributed flow in an existing environment | 2 (targeted pre-apply + full apply) | The policy update and the old flow's destroy run in the same apply with no edge between them. The targeted pre-apply settles the policy; the full apply completes the destroy. |

The third row is a **one-time migration cost per environment**, not a
recurring one: once every environment consumes the new module version,
all future applies — creation, feature work, promotion, teardown — are
single-apply.

## Related considerations

- The same pattern applies to any resource that is removed while a
  third-party reference to it is repointed in the same apply: policy
  distributions, application assignments, grants. Expect a possible
  `CONSTRAINT_VIOLATION` on the removal and plan for a targeted
  pre-apply of the reference, or split the change across applies.
- DaVinci flows that remain deployed but are no longer distributed by
  any policy are inert. Removing them promptly keeps environments clean
  and avoids confusion in the admin console.
- If the provider later models flow-policy membership with internal
  replacement semantics, the retry may become unnecessary. Check the
  provider changelog when upgrading.
