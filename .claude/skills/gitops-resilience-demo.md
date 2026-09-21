# GitOps Resilience Demo skill

Drives the Ping platform pipeline demo: automated rollback to an approved release,
restore-from-Git, reconciliation, drift detection with remediation, operational
validation, and the audit trail. The repo is `pipeline-example-platform-test`;
the pipeline is GitHub Actions; local tooling uses `pingcli` (human-authenticated,
never in CI).

## Use-case → tooling map

| # | Use case | Mechanism | Proof artifact |
|---|----------|-----------|----------------|
| 1 | Rollback to known-good | `git revert` merge → push → `push.yml` auto-apply | Actions log `N destroyed` |
| 2 | Restore config from Git as SSOT | Re-run Deploy job, or push, after UI deletion | Actions log recreate |
| 3 | Reconcile deployed vs desired | `terraform plan` (PR job, local deploy script, or drift workflow) | `No changes` |
| 4 | Drift detect + remediate | `.github/workflows/drift.yml` (hourly cron, `workflow_dispatch` w/ `remediate`) | drift run summary |
| 5 | Apps/policies/journeys restored | `scripts/demo/validate_resources.sh` (post-remediation) | OK lines |
| 6 | Full audit trail | `scripts/demo/audit_report.sh` + Actions history + tags | Markdown report |

## Preconditions (check at demo start)

1. `git -C . fetch origin && git status -sb` — clean tree, correct branch.
2. `make devcheck` passes.
3. `pingcli pingone auth status` → Authenticated (human device-code login; expires ~1 day).
   If expired: tell the user to run `pingcli pingone auth login`.
4. Target environment exists: `sh scripts/demo/validate_resources.sh --env <branch>` is the
   cheap existence probe (it is green when everything matches Git).
5. Approved release tags exist: `git tag -l 'v*'`. Never demo rollback without a tag to
   point at; tag with semver (`v1.0.0`) if missing, push it.

### Tagging a new approved release

```
git tag vX.Y.Z origin/prod && git push origin vX.Y.Z   # via HTTPS remote
```

Note: SSH remotes resolve to the wrong GitHub account on this machine. Push over HTTPS;
`gh` supplies credentials. If `gh auth switch` is needed, the repo owner account is
`samir-gandhi`, and `SamirGandhi_pingcorp` is the work account.

## Demo scenarios

### Scenario A: drift detected → remediated (UC3+4+5)

1. Inject drift locally with pingcli (never in CI):
   ```
   sh scripts/demo/inject_drift.sh --env <env> --type population-rename|delete-connector|delete-agreement
   ```
2. Show Terraform plan disagreeing: `terraform -chdir=terraform plan -input=false -detailed-exitcode`
   → exit 2 (drift). For the demo story, prefer triggering the GitHub `drift.yml`
   `workflow_dispatch` with `remediate=true` so the fix runs through the pipeline.
3. Local remediation equivalent (fallback if GitHub is slow):
   `terraform -chdir=terraform apply -input=false --auto-approve`
4. Validate restored + operational: `sh scripts/demo/validate_resources.sh --env <env>`
   → all OK lines, plan exit 0.

### Scenario B: rollback to approved known-good (UC1+2+6)

1. Confirm `git tag -l` and identify the bad commit on `prod`.
2. `git revert -m 1 <bad-merge>` on `prod`, push → `Feature Deploy Push` auto-applies,
   Actions log shows `1 destroyed`.
3. `sh scripts/demo/validate_resources.sh --env prod` → green.
4. `sh scripts/demo/audit_report.sh --branch prod --since <incident start>` → Markdown
   evidence; save to a file the user can share.

### Scenario C: restore from Git as SSOT (UC2+3)

1. Delete a managed resource via PingOne admin UI (population `Sample Users` is a good
   visual; the agreement requires disable-then-delete).
2. Re-run the `Deploy` job on the branch in Actions (or push to the branch).
3. Validate with `scripts/demo/validate_resources.sh` — population back, plan exit 0.

## Gotchas learned live

- PingOne API rejects `PATCH` on populations here — use `PUT` with the full body
  (`name`, `description`, `default` top-level, `preferredLanguage`). Wrong shape
  silently flips `default` to false, then plan shows re-add.
- Enabled agreements cannot be deleted; disable via PUT first.
- The PingOne provider refuses to delete a DaVinci flow still referenced by an
  application flow policy (`CONSTRAINT_VIOLATION`). When swapping flows, first
  target-apply the flow policy so it rebinds to the new flow, then apply the
  full plan to delete the old flow. Each branch env has its own state file
  (`platform-state/dev/<branch>/terraform.tfstate`) — fixes must be applied
  per-environment state, not just once.
- Terraform plan models population drift as delete+recreate (`1 to add`).
- `pingone_environment_id` export var comes from `terraform/ping-export-terraform.auto.tfvars`
  (gitignored, per-branch GH secret). CI needs `PING_EXPORT_TFVARS_<BRANCH>` uploaded via
  `./scripts/upload_ping_export_tfvars.sh` before any prod/qa run.
- Local terraform runs need `-reconfigure` when switching backend keys, and
  `TF_VAR_pingone_environment_name=<branch>` exported.
- Local plan against a fresh checkout fails with required-var errors — source
  `localsecrets` first; the validate script handles env naming for you.
- `drift.yml` is terraform-only by design: no pingcli, no client credentials in CI.
  Drift injection is a local, human-gated action.
- Private repo on free plan: no branch protection (403). "Approved release" is proven
  by semver tag + PR merge history; state this when demoing UC1.

## Export-module layout (post-merge)

All DaVinci-layer config (flows, DaVinci apps/policies, connector instances,
deploy/enable) lives in `terraform/ping-export-module/` with `pingcli__` names —
regenerate any time with `scripts/export_pingone.sh`. PingOne-side plumbing
(worker app, OIDC SDK sample app, grants, auth-policy assignment) stays in
`terraform/feature-pkg/` and consumes export-module outputs.

**Export overwrites**: `ping-export-module.tf`, `ping-export-variables.tf`,
everything in `ping-export-module/`, `ping-export-terraform.auto.tfvars` (incl.
any manually filled client secret), and `ping-export-imports.tf`. The export
script re-appends `ping-export-module/outputs.tf` afterwards; anything else
hand-edited inside the module is lost. State must be migrated with
`terraform state mv module.feature-pkg.<res> module.ping-export.<res>` when
resources move into the export module (per-environment state).

**Sample app**: `sample-app/` (11 files from the pkg repo). `global.js` is
generated by `feature-pkg` `local_file.env_config` (gitignored — contains the
DaVinci API key). Serve with `scripts/demo/serve_app.sh` (openssl s_server,
self-signed certs in `sample-app/certs/`), then open https://127.0.0.1:8443.

## Audit report

`scripts/demo/audit_report.sh --branch <branch> --since <ISO8601>` collects commits,
merged PRs, Actions runs, and tags into Markdown. Run it at the end of the demo and
save the output (e.g. `demo-audit-<date>.md`, uncommitted).
