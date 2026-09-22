#!/usr/bin/env sh
# Inject configuration drift into a branch-named PingOne environment via pingcli.
# Usage: scripts/demo/inject_drift.sh [--env <environment-name>] [--type <type>]
#
# Drift types (default: population-rename):
#   population-rename  Rename the sample population via the management API.
#   flow-rename        Rename the Protect flow title (demo UC4 story).
#   delete-connector   Delete the "Cookie" DaVinci connector instance.
#   delete-agreement   Delete the "Terms of Service" agreement.
#
# Each operation is reversible by the pipeline (Git as source of truth) and safe
# to run against sandbox environments.

set -eu

_env=""
_drift_type="population-rename"

_usage() {
  printf '%s\n' "Usage: $0 [--env <environment-name>] [--type population-rename|delete-connector|delete-agreement|flow-rename]"
  exit 2
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --env) [ "$#" -ge 2 ] || _usage; _env="$2"; shift 2 ;;
    --type) [ "$#" -ge 2 ] || _usage; _drift_type="$2"; shift 2 ;;
    -h|--help) _usage ;;
    *) _usage ;;
  esac
done

. "$(dirname -- "$0")/lib.sh"

[ -n "${_env}" ] || {
  _branch=$(git rev-parse --abbrev-ref HEAD)
  _env="${_branch}"
}
[ "${_env}" != "main" ] && [ "${_env}" != "prod" ] && [ "${_env}" != "qa" ] || {
  echo "refusing to inject drift into protected environment '${_env}' (use a feature branch env)" >&2
  exit 1
}

_env_id=$(_demo_env_id "${_env}")
[ -n "${_env_id}" ] || { echo "environment '${_env}' not found in PingOne" >&2; exit 1; }
echo "target: ${_env} (${_env_id})"

case "${_drift_type}" in
  population-rename)
    _pop_id=$(pingcli pingone api "environments/${_env_id}/populations" -O json --log-level error \
      --query 'data._embedded.populations[].{n:name,i:id}' 2>/dev/null \
      | jq -r '.[] | select(.n == "Sample Users") | .i' | head -1)
    [ -n "${_pop_id}" ] || { echo "population 'Sample Users' not found" >&2; exit 1; }
    # PUT (not PATCH): the PingOne API rejects PATCH on populations here.
    # Body shape uses top-level "default"; wrong shape silently flips default flag.
    pingcli pingone api "environments/${_env_id}/populations/${_pop_id}" \
      --http-method PUT \
      --data-raw '{"name": "Sample Users RENAMED", "description": "Sample Population", "default": true, "preferredLanguage": "en"}' \
      -O json --log-level error >/dev/null
    echo "drift injected: population '${_pop_id}' renamed to 'Sample Users RENAMED'"
    ;;
  delete-connector)
    _conn_id=$(pingcli davinci connector-instances list -e "${_env_id}" -O json --log-level error \
      --query 'data[].{n:name,i:id}' 2>/dev/null \
      | jq -r '.[] | select(.n == "Cookie") | .i' | head -1)
    [ -n "${_conn_id}" ] || { echo "connector instance 'Cookie' not found" >&2; exit 1; }
    pingcli davinci connector-instances delete -e "${_env_id}" \
      -c "${_conn_id}" -O json --log-level error >/dev/null
    echo "drift injected: connector instance 'Cookie' (${_conn_id}) deleted"
    ;;
  delete-agreement)
    _agr_id=$(pingcli pingone api "environments/${_env_id}/agreements" -O json --log-level error \
      --query 'data._embedded.agreements[].{n:name,i:id}' 2>/dev/null \
      | jq -r '.[] | select(.n == "Terms of Service") | .i' | head -1)
    [ -n "${_agr_id}" ] || { echo "agreement 'Terms of Service' not found" >&2; exit 1; }
    # The API refuses to delete an enabled agreement; disable first.
    pingcli pingone api "environments/${_env_id}/agreements/${_agr_id}" \
      --http-method PUT --data-raw '{"name": "Terms of Service", "description": "Terms of Service Agreement", "enabled": false}' \
      -O json --log-level error >/dev/null
    pingcli pingone api "environments/${_env_id}/agreements/${_agr_id}" \
      --http-method DELETE -O json --log-level error >/dev/null
    echo "drift injected: agreement 'Terms of Service' (${_agr_id}) deleted"
    ;;
  flow-rename)
    _flow_id=$(pingcli davinci flows list -e "${_env_id}" -O json --log-level error \
      --query 'data[].{n:name,i:id}' 2>/dev/null \
      | jq -r '.[] | select(.n == "PingOne DaVinci API Protect Example") | .i' | head -1)
    [ -n "${_flow_id}" ] || { echo "Protect flow not found" >&2; exit 1; }
    pingcli davinci flows replace -e "${_env_id}" \
      --flow-id "${_flow_id}" \
      --name "PingOne DaVinci API BADEmail Example" \
      -O json --log-level error >/dev/null
    echo "drift injected: flow '${_flow_id}' renamed to 'PingOne DaVinci API BADEmail Example'"
    ;;
esac
