#!/usr/bin/env sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "${ROOT}"

# The local check must execute the security scan, not merely validate the binary.
devcheck=$(make -n devcheck)
test "$(printf '%s\n' "${devcheck}" | grep -c 'trivy config')" -eq 1

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

# Per-branch tfvars secrets: dynamic lookup plus branch-derived upload naming.
grep -q 'secrets\[env.PING_EXPORT_SECRET_NAME\]' .github/workflows/push.yml
grep -q 'secrets\[env.PING_EXPORT_SECRET_NAME\]' .github/workflows/pull_request.yml
grep -q "PING_EXPORT_SECRET_NAME=PING_EXPORT_TFVARS_" .github/workflows/push.yml
grep -q "PING_EXPORT_SECRET_NAME=PING_EXPORT_TFVARS_" .github/workflows/pull_request.yml
grep -q 'PING_EXPORT_TFVARS_' scripts/upload_ping_export_tfvars.sh
grep -q -- '--dry-run' scripts/upload_ping_export_tfvars.sh

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
