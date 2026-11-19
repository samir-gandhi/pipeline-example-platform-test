# Terraform ordering pitfall: swapping a DaVinci flow behind an application flow policy

> Audience: anyone maintaining `terraform/ping-export-module` or promoting
> baseline module changes across environments.
> Symptom: `CONSTRAINT_VIOLATION — This Flow is in a Application Flow Policy`
> during `terraform apply` when a flow is removed from configuration.

## The scenario

The baseline module ships a sign-on experience: a DaVinci flow, a flow
policy that distributes it, and the policy assigned to the brand OIDC
application. Version 1 of the module rendered sign-on with inline HTML
template nodes; version 2 replaces it with a flow that renders the
environment's PingOne forms.

Environment state before the upgrade (v0.1.0):

```
pingone_davinci_flow.pingone_session_main_flow                (deployed, enabled)
pingone_davinci_application_flow_policy.sign_on_and_registration
  └── flow_distributions = [pingone_session_main_flow.id]     (weight 100)
pingone_application_flow_policy_assignment (portal app ← policy, priority 1)
```

Configuration after the upgrade (v0.2.0):

```
pingone_davinci_flow.irco_starter_kit          ← new (create)
pingone_davinci_application_flow_policy.sign_on_and_registration
  └── flow_distributions = [pingone_davinci_flow.irco_starter_kit.id]  (update)
pingone_davinci_flow.pingone_session_main_flow ← gone from config (destroy)
```

One `terraform apply` plans: 1 create, 1 update, 1 destroy. Naively this
should work — but the destroy fails.

## Why the destroy fails

Terraform orders work using **edges from the current configuration only**.
Walk the graph it builds for this apply:

| Edge | Source | Consequence |
|---|---|---|
| `flow_policy → irco_starter_kit` | policy references `pingone_davinci_flow.irco_starter_kit.id` | create the new flow **before** updating the policy ✓ |
| *(none)* | `session_main_flow` | The flow's config block was **removed** — a destroyed resource contributes no config, so **no edge can exist from the policy to it** |

With no edge between *update policy* and *destroy old flow*, Terraform
treats them as independent and runs them **in parallel**. The API then
races:

- if the destroy lands first, the apply succeeds;
- if the policy still references the flow when the destroy arrives,
  PingOne rejects it: `CONSTRAINT_VIOLATION — This Flow is in a
  Application Flow Policy` — and the apply errors, leaving the flow in
  state and environment.

The dependency we need is *"don't destroy X until Y stops referencing
X"* — but Y stops referencing X as a consequence of an update executed
in the same apply, and Terraform's graph has no primitive for
destroy-after-unrelated-update. It is the mirror image of the classic
"create B before updating A" problem: that one is fixable with
`depends_on`; this one is not, because destroyed resources carry no
config to attach edges to.

## When a second apply is required (and when it is not)

| Operation | Applies needed | Why |
|---|---|---|
| Fresh environment (no state) | **1** | Nothing old exists; create order is flow → deploy → enable → policy. No old flow can be policy-referenced. |
| Full destroy of an environment | **1** | The edge exists in reverse: policy is destroyed *before* the flows it references (reverse-dependency ordering), so the constraint can't trigger. |
| **Upgrading an environment that holds v0.1 flows** | **2** | Policy update (repoint to the new flow) and old-flow destroy run in the same apply with no edge between them. First apply settles the policy; second completes the destroy. This is a **one-time migration per environment**, not a recurring cost. |

After every environment has migrated to the new module version, all
future applies — creation, feature work, promotion, teardown — are
single-apply; the retry below becomes a silent no-op.

## The mitigation

Both the pipeline (`Deploy` job) and the local deploy script apply with a
single retry, because the failure is deterministically self-healing: the
first apply repoints the policy (removing the reference), so the second
apply's destroy finds no constraint. This is not masking flakiness — it
is completing a two-phase transition the graph model cannot express in
one pass.

```hcl
# .github/workflows/push.yml (Deploy job) — same pattern in scripts/local_feature_deploy.sh
terraform -chdir="${_tfdir}" apply --auto-approve -input=false || {
  echo "First apply failed; retrying to settle flow-policy destroy ordering..."
  terraform -chdir="${_tfdir}" apply --auto-approve -input=false
}
```

## Alternatives considered

- **Deprecation release**: keep the superseded flows in the module for one
  release, unreferenced, and drop them in the next. The destroy then
  happens in an apply with no policy change. Rejected: it would bake the
  dead HTML-template flow (~7.5k lines) into the module indefinitely.
- **Phase the migration as two PRs**: "repoint policy" then "remove old
  flows". Correct but turns every environment upgrade into a manual
  two-step ceremony.
- **Provider-side ordering**: a provider could model the policy's flow set
  with internal create-before-destroy semantics and absorb the ordering.
  The PingOne provider currently does not.

## General rule

Whenever configuration **removes** resource A while **repointing** a
third-party reference (policy, assignment, grant) away from A in the same
apply, expect a possible `CONSTRAINT_VIOLATION` on A's destroy, and plan
for one retry — or split the reference change and the removal across
applies.
