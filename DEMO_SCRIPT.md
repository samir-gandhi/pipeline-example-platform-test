# GitOps Resilience Demo Script

Exact commands for the six use-case demo. Repo: `pipeline-example-platform-test`.
Estimated total: 25–35 minutes including pipeline waits.

## Conventions

- All shell commands run from the repo root (`pipeline-example-platform-test/`).
- Pipeline waits: watch https://github.com/samir-gandhi/pipeline-example-platform-test/actions
- `localsecrets` holds Terraform/PingOne worker creds; `pingcli-localsecrets`
  holds Terraformer creds. Neither is committed.

---

## Phase 0 — Prep (before audience)

### 0.1 Logins

```sh
# GitHub CLI (once per machine):
gh auth switch -h github.com -u samir-gandhi        # repo owner account

# PingCLI (human device-code login; expires ~1 day):
pingcli pingone auth login                          # follow browser prompt
pingcli pingone auth status                         # expect: Authenticated
```

### 0.2 Source credentials

```sh
source localsecrets
source pingcli-localsecrets
export PINGCLI_PINGONE_ROOT_DOMAIN=pingone.com
```

### 0.3 Branch / release state (one-time, before the demo)

```sh
git checkout demo-prep && git pull origin demo-prep
# Merge demo-prep -> prod (PR or direct):
git checkout prod && git pull origin prod
git merge --no-ff demo-prep -m "Release: finalized GitOps resilience demo config"
git push origin prod                                # -> Feature Deploy Push runs, creates prod env
# Wait for green, then sync qa and tag:
git checkout qa && git merge --ff-only prod && git push origin qa   # -> qa env deploy
git checkout prod && git tag v1.1.0 && git push origin v1.1.0
git checkout demo-prep
```

### 0.4 Sanity check

```sh
make devcheck                                       # fmt/lint/validate/trivy
sh scripts/demo/validate_resources.sh --env prod    # all OK
pingcli davinci flows list -e $(cd terraform && terraform output -raw pingone_environment_id 2>/dev/null) -O json
```

---

## Phase 1 — Break prod (UC 5 setup)

Change the flow title in the **prod** environment via DaVinci (UI or API). The
scripted way:

```sh
sh scripts/demo/inject_drift.sh --env prod --type flow-rename
#   drift injected: flow renamed to 'PingOne DaVinci API BADEmail Example'
```

UI way: PingOne admin → DaVinci Administrators → **prod** environment →
Flows → *PingOne DaVinci API Protect Example* → rename title to
`PingOne DaVinci API BADEmail Example`.

Show the sample app failing or the flow title wrong in the DaVinci console:

```sh
sh scripts/demo/serve_app.sh &                      # https://127.0.0.1:8443
# open https://127.0.0.1:8443 in browser, accept self-signed cert
```

---

## Phase 2 — Drift detection + automated remediation (UC 4)

```sh
# Trigger the drift workflow against prod (no remediation first):
gh workflow run "Drift Detection and Remediation" -R samir-gandhi/pipeline-example-platform-test --ref prod -f remediate=false
# Watch it fail with the drift summary (terraform plan diff in the run summary)

# Now remediate through the pipeline:
gh workflow run "Drift Detection and Remediation" -R samir-gandhi/pipeline-example-platform-test --ref prod -f remediate=true
```

Watch the second run apply. Verify title corrected:

```sh
sh scripts/demo/validate_resources.sh --env prod    # all OK = title fixed, plan exit 0
pingcli davinci flows list -e "<prod env id>" -O json --log-level error | jq -r '.data[]?.name'
```

---

## Phase 3 — Revert prod from QA (UC 1 + 2)

Simulate a bad release reaching prod (in real life: a bad merge). Force a
known-bad state into prod, then revert to the approved release:

```sh
# Make a bad change on prod (deliberate):
git checkout prod
sed -i '' 's/name           = "Terms of Service"/name           = "Terms of Service BROKEN"/' terraform/pingone_platform.tf
git commit -am "BAD: break agreement title" && git push origin prod
# wait for Feature Deploy Push green, show agreement renamed in PingOne

# Roll back to the approved release tag:
git revert HEAD --no-edit && git push origin prod
# wait for Feature Deploy Push -> Actions log shows 1 destroyed / 1 created
```

Point out in the UI: git history shows `BAD` commit then `Revert`; the pipeline
restored the state; the `v1.1.0` tag marks the approved release.

Restore-from-Git variant (UC 2): delete the population in PingOne UI, then
re-run the **Deploy** job of the last successful `prod` run — resource returns.

```sh
sh scripts/demo/validate_resources.sh --env prod    # green again
```

---

## Phase 4 — Working application (UC 5)

```sh
sh scripts/demo/validate_resources.sh --env prod    # 11 OK lines incl. flow deployed v1
sh scripts/demo/serve_app.sh &                      # https://127.0.0.1:8443
```

Browser: register `demouser1@mailinator.com` / `2FederateM0re!` → dashboard shows
email + PingOne Protect risk assessment (level/score). End-user journey works —
flow, policy, connectors, notifications all restored from Git.

---

## Phase 5 — New feature + export (UC 3 + export capability)

```sh
# 1. Create the feature branch (GitHub Issue -> Create a branch, or locally):
git checkout prod && git pull && git checkout -b 12-protect-flow-enhancement && git push -u origin 12-protect-flow-enhancement
# -> push.yml deploys a new PingOne environment named after the branch

# 2. Build a change in the new env's DaVinci console (e.g. tweak a node or title).

# 3. Export the console work as code (2s, zero post-processing):
sh scripts/export_pingone.sh                        # writes terraform/ping-export-module + tfvars
git status                                          # generated files changed
terraform -chdir=terraform plan -input=false -detailed-exitcode   # plan shows the drift vs old code

# 4. Upload branch export tfvars as a GH secret (CI needs them):
./scripts/upload_ping_export_tfvars.sh

# 5. Commit, push, open PR to qa: plan job shows the diff as review artifact.
git add terraform/ && git commit -m "Export <feature> from console" && git push origin 12-protect-flow-enhancement
gh pr create --base qa --head <branch> --title "Feature: ..." --fill
# merge PR -> qa deploy; then PR qa -> prod for promotion
```

Reconciliation proof (UC 3): `terraform plan` says `No changes` right after the
export + apply — deployed resources now match code exactly.

---

## Phase 6 — Audit trail (UC 6)

```sh
sh scripts/demo/audit_report.sh --branch prod --since "1 hour ago" > demo-audit.md
```

Then narrate in GitHub UI:
1. **Actions** — every deploy, drift run, revert run with plan summaries.
2. **Commits/PRs** — the BAD commit, its revert, the export PR review.
3. **Tags** — `v1.1.0` marks the approved release.
4. **Artifacts** — plan output attached in run summaries.

---

## Troubleshooting quick ref

| Symptom | Fix |
|---|---|
| `pingcli not authenticated` | `pingcli pingone auth login` |
| CI: `base64: invalid input` | re-upload both secrets: `gh secret set --app actions TERRAFORM_ENV_BASE64 --body "$(base64 -i localsecrets \| tr -d '\n')"` and `./scripts/upload_ping_export_tfvars.sh` (script now uploads raw base64, matching CI) |
| CI: missing `PING_EXPORT_TFVARS_<BRANCH>` | `./scripts/upload_ping_export_tfvars.sh` from that branch |
| Flow delete blocked (`CONSTRAINT_VIOLATION`) | rebind flow policy first (`terraform apply -target=...policy...`), then full apply |
| Agreement won't delete | disable via PUT first, then DELETE |
| Export leaves `clientSecret = ""` | script backfills from state; if state was reset, re-apply once from a working state first |
| SSH push fails (wrong account) | push over HTTPS: `git push https://github.com/samir-gandhi/pipeline-example-platform-test.git <branch>` with `gh` authed as `samir-gandhi` |
