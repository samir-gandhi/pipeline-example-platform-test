#!/usr/bin/env sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "${ROOT}"

# The local check must execute fmt/validate/lint; trivy was removed from CI
# and devcheck (misconfig findings on the sample-app S3 bucket, tracked
# separately if reintroduced).
devcheck=$(make -n devcheck)
test "$(printf '%s\n' "${devcheck}" | grep -c 'tflint --recursive')" -eq 1
test "$(printf '%s\n' "${devcheck}" | grep -c 'trivy config')" -eq 0

# Workflow contracts: no floating scanner/tool references or interactive Terraform.
! grep -R -n -E '@master|tflint_version:[[:space:]]*latest' .github/workflows
! grep -R -n -E 'terraform -chdir=.* (init|plan|apply|destroy)( |$)' .github/workflows | grep -v -- '-input=false'

grep -q 'github.ref_type == '\''branch'\''' .github/workflows/push.yml
grep -q 'github.event.ref_type == '\''branch'\''' .github/workflows/prune.yml
grep -q 'permissions:' .github/workflows/push.yml
grep -q 'permissions:' .github/workflows/pull_request.yml
grep -q 'permissions:' .github/workflows/prune.yml

# The deprecated DaVinci provider/resources and old credentials are gone.
if grep -R -n 'pingidentity/davinci\|resource "davinci_connection"\|provider "davinci"' terraform --include='*.tf' --include='*.hcl'; then
  echo 'deprecated DaVinci provider or resource found' >&2
  exit 1
fi
if grep -R -n 'TF_VAR_pingone_davinci_admin_username\|TF_VAR_pingone_davinci_admin_password\|TF_VAR_pingone_davinci_admin_region' scripts secretstemplate terraform --include='*.sh' --include='*.tf'; then
  echo 'deprecated DaVinci credentials found' >&2
  exit 1
fi
grep -q 'pingone_davinci_connector_instance' terraform/ping-export-module/pingone_davinci_connector_instance.tf
grep -q '_output_dir="terraform"' scripts/export_pingone.sh
grep -q -- '--include-values' scripts/export_pingone.sh
git check-ignore -q pingcli-localsecrets

# Connector credentials and environment id are derived, not exported: the
# wrapper must reference the worker applications and target_environment, and
# the workflows must not reference the retired per-branch tfvars secret.
grep -q 'pingone_application.davinci_connection_worker.id' terraform/ping-export-module.tf
grep -q 'pingone_application.protect_worker.id' terraform/ping-export-module.tf
grep -q 'pingone_environment.target_environment.id' terraform/ping-export-module.tf
! grep -R -q 'PING_EXPORT_TFVARS' .github/workflows scripts
test ! -e scripts/upload_ping_export_tfvars.sh

# Generated/runtime files are ignored; authored Terraform remains visible.
for path in tfplan plan.tfplan terraform/terraform.tfplan tfvars terraform/terraform-debug.log; do
  git check-ignore -q "${path}"
done
git check-ignore -q .polaris/
! git check-ignore -q terraform/example.tf

test -f terraform/.terraform.lock.hcl
! git check-ignore -q terraform/.terraform.lock.hcl

sh -n scripts/lib.sh scripts/local_feature_deploy.sh

echo 'pipeline contract checks passed'
