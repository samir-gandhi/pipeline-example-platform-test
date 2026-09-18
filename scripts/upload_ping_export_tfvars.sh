#!/usr/bin/env sh
# Upload the generated export tfvars as a branch-specific GitHub Actions secret.

set -eu

_usage() {
  printf '%s\n' "Usage: $0 [--environment qa|prod] [--file PATH] [--out NAME] [--dry-run]"
  exit 2
}

_environment=""
_tfvars_file="terraform/ping-export-terraform.auto.tfvars"
_secret_name_override=""
_dry_run=false
_repo_root=$(git rev-parse --show-toplevel)
cd "${_repo_root}"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --environment)
      [ "$#" -ge 2 ] || _usage
      _environment="$2"
      shift 2
      ;;
    --file)
      [ "$#" -ge 2 ] || _usage
      _tfvars_file="$2"
      shift 2
      ;;
    --out)
      [ "$#" -ge 2 ] || _usage
      _secret_name_override="$2"
      shift 2
      ;;
    --dry-run)
      _dry_run=true
      shift
      ;;
    -h|--help)
      _usage
      ;;
    *)
      _usage
      ;;
  esac
done

command -v gh >/dev/null 2>&1 || {
  printf '%s\n' "gh is required; install the GitHub CLI first." >&2
  exit 1
}

if [ -n "${_secret_name_override}" ]; then
  _secret_name="${_secret_name_override}"
else
  if [ -n "${_environment}" ]; then
    case "${_environment}" in
      qa|prod) _suffix=$(printf '%s' "${_environment}" | tr '[:lower:]' '[:upper:]') ;;
      *) printf '%s\n' "--environment accepts only qa or prod; omit it to derive the name from the current branch." >&2; exit 1 ;;
    esac
  else
    _branch=$(git rev-parse --abbrev-ref HEAD)
    case "${_branch}" in
      ''|HEAD|*[!A-Za-z0-9._/-]*)
        printf '%s\n' "A named branch is required; use --environment or --out from a detached checkout." >&2
        exit 1
        ;;
    esac
    _suffix=$(printf '%s' "${_branch}" | tr '[:lower:]/.-' '[:upper:]___')
  fi
  _secret_name="PING_EXPORT_TFVARS_${_suffix}"
fi

case "${_secret_name}" in
  *[!A-Za-z0-9_]*|GITHUB_*|[0-9]*)
    printf '%s\n' "Invalid secret name: ${_secret_name}. GitHub allows only [A-Za-z0-9_], and names must not start with a number or GITHUB_." >&2
    exit 1
    ;;
esac

[ -f "${_tfvars_file}" ] || {
  printf '%s\n' "tfvars file not found: ${_tfvars_file}. Run ./scripts/export_pingone.sh first." >&2
  exit 1
}
[ -s "${_tfvars_file}" ] || {
  printf '%s\n' "tfvars file is empty: ${_tfvars_file}." >&2
  exit 1
}

if grep -q 'clientSecret[[:space:]]*=[[:space:]]*""' "${_tfvars_file}"; then
  printf '%s\n' "Warning: davinci_connection_PingOne_clientSecret is empty in ${_tfvars_file}." >&2
fi

_tfvars_b64="$(/usr/bin/base64 -i "${_tfvars_file}" | tr -d '\n')"

_secret_body="export PING_EXPORT_TFVARS_B64='${_tfvars_b64}'"

if [ "${_dry_run}" = true ]; then
  printf '%s\n' "secret: ${_secret_name}"
  printf '%s\n' "body length: ${#_secret_body}"
else
  gh secret set --app actions "${_secret_name}" --body "${_secret_body}"
  printf '%s\n' "Uploaded ${_secret_name}"
fi

unset _tfvars_b64 _secret_body
