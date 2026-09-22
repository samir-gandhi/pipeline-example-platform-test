#!/usr/bin/env sh
# Shared setup for demo drift helpers. Source, don't execute.
# Requires: repo root as working directory or DEMO_REPO_ROOT set.

set -eu

_repo_root=$(git rev-parse --show-toplevel 2>/dev/null || printf '%s' "${DEMO_REPO_ROOT:-}")
[ -n "${_repo_root}" ] || { echo "not in a git repository; set DEMO_REPO_ROOT" >&2; exit 1; }
cd "${_repo_root}"

[ -f localsecrets ] || { echo "localsecrets missing; copy secretstemplate first" >&2; exit 1; }

# pingcli auth comes from a human login (device code) persisted in the OS keychain.
# Run `pingcli pingone auth login` once if the session is missing or expired.
pingcli pingone auth status 2>&1 | grep -q "Authenticated" || {
  echo "pingcli not authenticated; run: pingcli pingone auth login" >&2
  exit 1
}

command -v pingcli >/dev/null 2>&1 || { echo "pingcli not installed" >&2; exit 1; }
command -v terraform >/dev/null 2>&1 || { echo "terraform not installed" >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "jq not installed" >&2; exit 1; }

# Resolve the environment ID for a branch-named environment via the PingOne API.
# Usage: _demo_env_id <environment-name>
_demo_env_id() {
  _name=$(printf '%s' "$1" | sed 's/ /%20/g')
  pingcli pingone api "environments?size=100" -O json --log-level error \
    --query 'data._embedded.environments[].{n:name,i:id}' 2>/dev/null \
    | jq -r --arg n "$1" '.[] | select(.n == $n) | .i' | head -1
}

# Resolve the Terraform state key for a branch, matching the push workflow.
# Usage: _demo_state_key <branch>
_demo_state_key() {
  case "$1" in
    prod) printf '%s' "${TF_VAR_tf_state_key_prefix}/prod/terraform.tfstate" ;;
    qa)   printf '%s' "${TF_VAR_tf_state_key_prefix}/qa/terraform.tfstate" ;;
    *)    printf '%s' "${TF_VAR_tf_state_key_prefix}/dev/$1/terraform.tfstate" ;;
  esac
}
