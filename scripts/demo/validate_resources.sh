#!/usr/bin/env sh
# Validate that managed resources in a branch-named environment are restored and
# operational. Used as post-rollback/remediation evidence in the demo.
# Usage: scripts/demo/validate_resources.sh [--env <environment-name>]
#
# Exits non-zero and prints FAILED lines when a managed resource is missing or
# not operational.

set -eu

_env=""
_failures=0

_usage() {
  printf '%s\n' "Usage: $0 [--env <environment-name>]"
  exit 2
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --env) [ "$#" -ge 2 ] || _usage; _env="$2"; shift 2 ;;
    -h|--help) _usage ;;
    *) _usage ;;
  esac
done

. "$(dirname -- "$0")/lib.sh"

[ -n "${_env}" ] || _env=$(git rev-parse --abbrev-ref HEAD)

_env_id=$(_demo_env_id "${_env}")
[ -n "${_env_id}" ] || { echo "environment '${_env}' not found in PingOne" >&2; exit 1; }
echo "validating ${_env} (${_env_id})..."

_ok() { printf '  OK     %s\n' "$1"; }
_fail() { printf '  FAILED %s\n' "$1"; _failures=$((_failures + 1)); }

# 1. Environment exists (API returns its properties).
_env_json=$(pingcli pingone api "environments/${_env_id}" -O json --log-level error 2>/dev/null)
[ "$(printf '%s' "${_env_json}" | jq -r '.data.id // empty')" = "${_env_id}" ] \
  && _ok "environment present" || _fail "environment not readable"

# 2. Sample population exists with the managed name.
_pop=$(pingcli pingone api "environments/${_env_id}/populations" -O json --log-level error 2>/dev/null \
  | jq -r '[.data._embedded.populations[]? | select(.name == "Sample Users")] | length')
[ "${_pop}" -ge 1 ] 2>/dev/null \
  && _ok "population 'Sample Users' present" || _fail "population 'Sample Users' missing or renamed"

# 3. DaVinci Connection Worker application exists and is enabled.
_app=$(pingcli pingone api "environments/${_env_id}/applications" -O json --log-level error 2>/dev/null \
  | jq -r '[.data._embedded.applications[]? | select(.name == "DaVinci Connection Worker" and .enabled == true)] | length')
[ "${_app}" -ge 1 ] 2>/dev/null \
  && _ok "application 'DaVinci Connection Worker' enabled" || _fail "application 'DaVinci Connection Worker' missing/disabled"

# 4. OIDC SDK resource exists.
_res=$(pingcli pingone api "environments/${_env_id}/resources" -O json --log-level error 2>/dev/null \
  | jq -r '[.data._embedded.resources[]? | select(.name == "OIDC SDK")] | length')
[ "${_res}" -ge 1 ] 2>/dev/null \
  && _ok "resource 'OIDC SDK' present" || _fail "resource 'OIDC SDK' missing"

# 5. Terms of Service agreement exists and is enabled.
_agr=$(pingcli pingone api "environments/${_env_id}/agreements" -O json --log-level error 2>/dev/null \
  | jq -r '[.data._embedded.agreements[]? | select(.name == "Terms of Service")] | length')
[ "${_agr}" -ge 1 ] 2>/dev/null \
  && _ok "agreement 'Terms of Service' present" || _fail "agreement 'Terms of Service' missing"

# 6. Protect main flow exists, deployed, and enabled.
_MAIN_FLOW="PingOne DaVinci API Protect Example"
_flow=$(pingcli davinci flows list -e "${_env_id}" -O json --log-level error 2>/dev/null \
  | jq -r '[.data[]? | select(.name == "'"${_MAIN_FLOW}"'")] | length')
[ "${_flow}" -ge 1 ] 2>/dev/null \
  && _ok "main flow 'PingOne DaVinci API Protect Example' present" || _fail "Protect flow missing"

_flow_id=$(pingcli davinci flows list -e "${_env_id}" -O json --log-level error 2>/dev/null \
  | jq -r '.data[]? | select(.name == "'"${_MAIN_FLOW}"'") | .id' | head -1)
if [ -n "${_flow_id}" ]; then
  _flow_en=$(pingcli davinci flows get -e "${_env_id}" --flow-id "${_flow_id}" -O json --log-level error 2>/dev/null \
    | jq -r '.data.enabled // false')
  [ "${_flow_en}" = "true" ] \
    && _ok "Protect flow enabled" || _fail "Protect flow not enabled"
  _flow_ver=$(pingcli davinci flows list -e "${_env_id}" -O json --log-level error 2>/dev/null \
    | jq -r '.data[]? | select(.name == "'"${_MAIN_FLOW}"'") | .currentVersion // empty')
  [ -n "${_flow_ver}" ] \
    && _ok "Protect flow deployed (version ${_flow_ver})" || _fail "Protect flow not deployed"
else
  _fail "Protect flow not deployed (no flow ID)"
fi

# 6b. Protect + Variables connector instances present.
_ci=$(pingcli davinci connector-instances list -e "${_env_id}" -O json --log-level error 2>/dev/null \
  | jq -r '[.data[]? | select(.name == "PingOne Protect" or .name == "Variables")] | length')
[ "${_ci}" -ge 2 ] 2>/dev/null \
  && _ok "Protect + Variables connector instances present" || _fail "solution connector instances missing (${_ci:-0}/2)"

# 7. DaVinci application with API key enabled exists.
_app=$(pingcli davinci applications list -e "${_env_id}" -O json --log-level error 2>/dev/null \
  | jq -r '[.data[]? | select(.name == "DaVinci API Protect Sample Application" and .apiKey.enabled == true)] | length')
[ "${_app}" -ge 1 ] 2>/dev/null \
  && _ok "DaVinci application 'DaVinci API Protect Sample Application' enabled" || _fail "Protect DaVinci application missing/disabled"

# 8. Terraform reports no differences (reconciliation complete) when TF vars available.
if [ -n "${TF_VAR_pingone_license_id:-}" ] && [ -f terraform/.terraform.lock.hcl ]; then
  set +e
  export TF_VAR_pingone_environment_name="${_env}"
  terraform -chdir=terraform init -input=false -reconfigure \
    -backend-config="bucket=${TF_VAR_tf_state_bucket}" \
    -backend-config="region=${TF_VAR_tf_state_region}" \
    -backend-config="key=$(_demo_state_key "${_env}")" >/dev/null 2>&1
  terraform -chdir=terraform plan -input=false -detailed-exitcode -no-color >/dev/null 2>&1
  _code=$?
  set -e
  case "${_code}" in
    0) _ok "terraform plan: no differences (state matches Git)" ;;
    2) _fail "terraform plan: differences remain (state does not match Git)" ;;
    *) _fail "terraform plan failed (exit ${_code})" ;;
  esac
else
  echo "  SKIP   terraform reconciliation check (license vars not set)"
fi

echo "validation complete: ${_failures} failure(s)"
[ "${_failures}" -eq 0 ]
