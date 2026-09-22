# GitOps Resilience Demo Script

Live walkthrough of the Ping Identity GitOps Terraform pipeline. Repo:
`pipeline-example-platform-test`. Flow: ~30 minutes including pipeline waits.

Narrative: start a feature in the background, prove prod heals itself from
drift, build a real change in a dev environment, export it to code, promote
it through qa to prod, tag it as a release — then change our minds and revert.

## Conventions

- All shell commands run from the repo root (`pipeline-example-platform-test/`).
- `origin` uses HTTPS with the `gh` credential helper (authed as
  `samir-gandhi`). Watch pipelines at
  https://github.com/samir-gandhi/pipeline-example-platform-test/actions
- Tenant: BBC EU (`pingone.eu`). Prod app: https://demo.pingdevops.com
- `localsecrets` (gitignored) holds worker creds, regenerated from 1Password
  via `./scripts/regen_localsecrets.sh`.

---

## Phase 0 — Prep (before audience)

```sh
gh auth switch -h github.com -u samir-gandhi       # repo owner account

# PingCLI (human device-code login; expires ~1 day):
pingcli pingone auth login                         # follow browser prompt — BBC tenant
pingcli pingone auth status                        # expect: Authenticated

source localsecrets                                # worker creds + AWS + state vars
export PINGCLI_PINGONE_ROOT_DOMAIN=pingone.eu

# Sanity: prod environment healthy and reconciled with Git
sh scripts/demo/validate_resources.sh --env prod   # expect all OK
```

Point out in GitHub: `prod` and `qa` branches are green, tag `v1.1.0` marks
the current approved release, the Drift workflow runs hourly.

---

## Phase 1 — Feature branch (start early, runs in background)

```sh
git checkout prod && git pull origin prod
git checkout -b 20-add-phone-connector && git push -u origin 20-add-phone-connector
```

While you demo the other phases, the pipeline provisions a **new PingOne
environment** (`20-add-phone-connector`) in the background: environment,
population, agreements, workers, the DaVinci Protect stack, and role
assignments — everything as code. Nothing manual.

Watch the run go green before Phase 3.

---

## Phase 2 — Drift in prod + automated remediation (UC 4)

Break prod by hand — the DaVinci console way, or the scripted equivalent:

```sh
sh scripts/demo/inject_drift.sh --env prod --type flow-rename
#   flow renamed to 'PingOne DaVinci API BADEmail Example'
```

Show the broken title in the DaVinci console (prod environment → Flows).
Then let the pipeline detect and correct it:

```sh
# Detect only — the run FAILS, showing the drift diff as its summary:
gh workflow run "Drift Detection and Remediation" --ref prod -f remediate=false

# Remediate — the workflow applies the plan, restoring Git as source of truth:
gh workflow run "Drift Detection and Remediation" --ref prod -f remediate=true
```

Verify:

```sh
sh scripts/demo/validate_resources.sh --env prod   # all OK, title restored
```

Talking point: an hourly cron runs the same detection; Git is the source of
truth, and out-of-band changes are pulled back automatically.

---

## Phase 3 — Build the feature in the dev environment, export as code (UC 3)

In the DaVinci console for the **`20-add-phone-connector`** environment:

1. Connections → add a connector (e.g. **Http** — quick, no credentials
   needed; name it `Phone Lookup`)
2. Optionally touch the flow (rename a node or the flow title)

Export the console work as code (~2s, zero post-processing):

```sh
git checkout 20-add-phone-connector
sh scripts/export_pingone.sh
#   module regenerated + connector vars/env-id stripped by post-hooks
git status                                        # generated files changed

terraform -chdir=terraform plan -input=false -detailed-exitcode
#   exit 2 with the new connector in the diff = reconciliation proof (UC 3):
#   deployed env and code agree; the diff is the feature itself
```

---

## Phase 4 — Promote: PR → qa → prod, tag the release (UC 1, 2, 6)

```sh
git add terraform/ && git commit -m "Add Phone Lookup connection" && git push origin 20-add-phone-connector

# Review artifact: the PR plan job shows the exact infrastructure diff
gh pr create --base qa --head 20-add-phone-connector \
  --title "Add Phone Lookup connection" --fill
# merge the PR -> pipeline deploys the change into the qa environment

# Promote qa -> prod the same way:
gh pr create --base prod --head qa --title "Promote Phone Lookup to prod" --fill
# merge -> prod deploy

# Mark the approved release:
git checkout prod && git pull origin prod && git tag v1.2.0 && git push origin v1.2.0
```

Show in the PingOne console: the connector exists in qa's environment, then
in prod's — identical, because both were applied from the same code.

---

## Phase 5 — Rollback: revert prod to the approved release (UC 1 + 2)

A tweak landed after the release (say, an over-eager flow title tweak that
we now regret):

```sh
git checkout prod
sed -i '' 's/name           = "Terms of Service"/name           = "Terms of Service v2"/' terraform/pingone_platform.tf
git commit -am "Post-release tweak" && git push origin prod
# wait for Feature Deploy Push -> agreement title changes in prod
```

Now decide we preferred `v1.2.0` and revert prod to the approved release:

```sh
git revert HEAD --no-edit                          # undoes the post-release commit
git push origin prod
# -> Feature Deploy Push: plan restores the v1.2.0 state exactly
```

In the Actions log, show the plan summary: the agreement name restored,
nothing else touched. In PingOne: prod matches `v1.2.0` again. The qa
environment is unaffected — environments are independent.

Optional UC 2 flourish (restore-from-Git): delete the population
`Sample Users` in the prod PingOne console, then re-run the **Deploy** job of
the last successful prod run — the population returns from code.

---

## Phase 6 — Audit trail (UC 6)

```sh
sh scripts/demo/audit_report.sh --branch prod --since "$(date -v-2H '+%Y-%m-%dT%H:%M:%SZ')" > demo-audit.md
```

Then narrate in GitHub UI:
1. **Actions** — the feature deploy, two drift runs (fail + remediate), the
   promotion deploys, the revert run, each with its plan summary
2. **PRs** — the feature review with the plan as the review artifact, and the
   revert commit
3. **Tags** — `v1.2.0` marks the release we reverted; the tag survives as the
   record even after rollback, proving release discipline
4. **Environments** — the feature branch's own environment, created and
   (if the branch is deleted) destroyed by the pipeline

---

## Troubleshooting quick ref

| Symptom | Fix |
|---|---|
| `pingcli not authenticated` | `pingcli pingone auth login` (BBC tenant) |
| CI: `base64: invalid input` | `gh secret set --app actions TERRAFORM_ENV_BASE64 --body "$(base64 -i localsecrets \| tr -d '\n')"` |
| `localsecrets` missing/stale | `./scripts/regen_localsecrets.sh` (resolves 1Password refs) |
| Flow delete blocked (`CONSTRAINT_VIOLATION`) | rebind flow policy first (`terraform apply -target=...policy...`), then full apply |
| Agreement won't delete | disable via PUT first, then DELETE |
| ACM: `Tried to create resource record set ... already exists` | validation records are prod-managed; import into state: `terraform -chdir=terraform import 'aws_route53_record.sample_app_cert_validation["<domain>"]' "Z5N4EF12SSGL2_<record>._CNAME"` |
| Export leaves empty module | export tool couldn't read DaVinci (wrong creds/region); check worker has DaVinci scopes and `PINGCLI_PINGONE_REGION_CODE=EU` |
| DNS: browser can't resolve `demo.pingdevops.com` | router cached the pre-launch NXDOMAIN; switch to DoH/1.1.1.1 or wait out the SOA TTL |
| SSH push fails (wrong account) | `origin` is HTTPS + gh credential helper; if reset, `gh auth setup-git` |
| Local app: `https://127.0.0.1:8443` cert warning | expected (self-signed); accept to continue |
