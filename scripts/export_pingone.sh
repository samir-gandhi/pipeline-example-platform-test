#!/usr/bin/env sh
# Export supported PingOne/DaVinci configuration for the current feature branch.

set -eu

_usage() {
  printf '%s\n' "Usage: $0 [--environment-id UUID] [--out DIR]"
  exit 2
}

_environment_id=""
_output_dir="terraform"
_repo_root=$(git rev-parse --show-toplevel)
cd "${_repo_root}"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --environment-id)
      [ "$#" -ge 2 ] || _usage
      _environment_id="$2"
      shift 2
      ;;
    --out)
      [ "$#" -ge 2 ] || _usage
      _output_dir="$2"
      shift 2
      ;;
    -h|--help)
      _usage
      ;;
    *)
      _usage
      ;;
  esac
done

command -v pingcli-terraformer >/dev/null 2>&1 || {
  printf '%s\n' "pingcli-terraformer is required; install pingidentity/pingcli-plugin-terraformer first." >&2
  exit 1
}
command -v terraform >/dev/null 2>&1 || {
  printf '%s\n' "terraform is required." >&2
  exit 1
}

[ -n "${PINGCLI_PINGONE_CLIENT_CREDENTIALS_CLIENT_ID-}" ] || {
  printf '%s\n' "PINGCLI_PINGONE_CLIENT_CREDENTIALS_CLIENT_ID is required." >&2
  exit 1
}
[ -n "${PINGCLI_PINGONE_CLIENT_CREDENTIALS_CLIENT_SECRET-}" ] || {
  printf '%s\n' "PINGCLI_PINGONE_CLIENT_CREDENTIALS_CLIENT_SECRET is required." >&2
  exit 1
}
[ -n "${PINGCLI_PINGONE_ENVIRONMENT_ID-}" ] || {
  printf '%s\n' "PINGCLI_PINGONE_ENVIRONMENT_ID is required." >&2
  exit 1
}
[ -n "${PINGCLI_PINGONE_REGION_CODE-}" ] || {
  printf '%s\n' "PINGCLI_PINGONE_REGION_CODE is required." >&2
  exit 1
}

_branch=$(git rev-parse --abbrev-ref HEAD)
case "${_branch}" in
  ''|HEAD|*[!A-Za-z0-9._/-]*)
    printf '%s\n' "A named branch is required; use --environment-id from a detached checkout." >&2
    exit 1
    ;;
esac

if [ -z "${_environment_id}" ]; then
  if [ -f localsecrets ]; then
    # Use the same remote state key as the deployment workflows.
    . ./localsecrets
    case "${_branch}" in
      prod) _state_key="${TF_VAR_tf_state_key_prefix}/prod/terraform.tfstate" ;;
      qa) _state_key="${TF_VAR_tf_state_key_prefix}/qa/terraform.tfstate" ;;
      *) _state_key="${TF_VAR_tf_state_key_prefix}/dev/${_branch}/terraform.tfstate" ;;
    esac
    terraform -chdir=terraform init -input=false -reconfigure \
      -backend-config="bucket=${TF_VAR_tf_state_bucket}" \
      -backend-config="region=${TF_VAR_tf_state_region}" \
      -backend-config="key=${_state_key}" >/dev/null
  fi
  _environment_id=$(terraform -chdir=terraform output -raw pingone_environment_id 2>/dev/null || true)
fi

[ -n "${_environment_id}" ] || {
  printf '%s\n' "Pass --environment-id or initialize the branch Terraform state." >&2
  exit 1
}

case "${_environment_id}" in
  [0-9a-fA-F][0-9a-fA-F]*-[0-9a-fA-F-]*) ;;
  *) printf '%s\n' "Environment ID must be a UUID." >&2; exit 1 ;;
esac

mkdir -p "${_output_dir}"
pingcli-terraformer export \
  --pingone-worker-environment-id "${PINGCLI_PINGONE_ENVIRONMENT_ID}" \
  --pingone-export-environment-id "${_environment_id}" \
  --pingone-worker-client-id "${PINGCLI_PINGONE_CLIENT_CREDENTIALS_CLIENT_ID}" \
  --pingone-worker-client-secret "${PINGCLI_PINGONE_CLIENT_CREDENTIALS_CLIENT_SECRET}" \
  --pingone-region-code "${PINGCLI_PINGONE_REGION_CODE}" \
  --include-values \
  --include-imports \
  --out "${_output_dir}"

# --- Post-export hooks ------------------------------------------------------
# The exporter rewrites the module directory; hand-maintained additions must be
# restored afterwards.

# 1. Restore the outputs the export tool does not generate. The feature-pkg
#    module and demo validation reference these outputs.
if [ "${_output_dir}" = "terraform" ] && [ -d terraform/ping-export-module ]; then
  cat > terraform/ping-export-module/outputs.tf <<'OUTTF'
output "connector_instance_ids" {
  description = "DaVinci connector instance IDs from the export, keyed by connector id"
  value = {
    pingOne      = pingone_davinci_connector_instance.pingcli__PingOne.id
    Http         = pingone_davinci_connector_instance.pingcli__Http.id
    Annotation   = pingone_davinci_connector_instance.pingcli__Annotation.id
    ErrorMessage = pingone_davinci_connector_instance.pingcli__Error-0020-Message.id
    Cookie       = pingone_davinci_connector_instance.pingcli__Cookie.id
  }
}
OUTTF
  # Flow/policy outputs are only appended when those resource types exist.
  if grep -q 'resource "pingone_davinci_application_flow_policy"' terraform/ping-export-module/*.tf 2>/dev/null; then
    _policy_label=$(grep -hE 'resource "pingone_davinci_application_flow_policy" "[^"]+"' terraform/ping-export-module/*.tf | sed 's/.*"\(.*\)".*/\1/' | head -1)
    cat >> terraform/ping-export-module/outputs.tf <<OUTTF

output "flow_policy_ids" {
  description = "DaVinci application flow policy IDs from the export"
  value = {
    main = pingone_davinci_application_flow_policy.${_policy_label}.id
  }
}
OUTTF
  fi
  if grep -q 'resource "pingone_davinci_application"' terraform/ping-export-module/*.tf; then
    _app_label=$(grep -hE 'resource "pingone_davinci_application" "[^"]+"' terraform/ping-export-module/*.tf | sed 's/.*"\(.*\)".*/\1/' | head -1)
    cat >> terraform/ping-export-module/outputs.tf <<'OUTTF'

output "davinci_application_ids" {
  description = "DaVinci application IDs from the export"
  value = {
    main = pingone_davinci_application.${_app_label}.id
  }
}

output "davinci_application_api_key" {
  description = "DaVinci application API key for the sample app"
  value       = pingone_davinci_application.${_app_label}.api_key.value
  sensitive   = true
}
OUTTF
  fi
  echo "Restored outputs.tf in ping-export-module"
fi

# 2. Patch flow outputs referencing flow resources generically (feature-pkg uses
#    flow_ids.main).
if [ "${_output_dir}" = "terraform" ] && grep -q 'resource "pingone_davinci_flow"' terraform/ping-export-module/*.tf 2>/dev/null; then
  _flow_label=$(grep -hE 'resource "pingone_davinci_flow" "[^"]+"' terraform/ping-export-module/*.tf | sed 's/.*"\(.*\)".*/\1/' | head -1)
  if ! grep -q "output \"flow_ids\"" terraform/ping-export-module/outputs.tf; then
    cat >> terraform/ping-export-module/outputs.tf <<OUTTF

output "flow_ids" {
  description = "DaVinci flow IDs from the export"
  value = {
    main = pingone_davinci_flow.${_flow_label}.id
  }
}
OUTTF
  fi
fi
