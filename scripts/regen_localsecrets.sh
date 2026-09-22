#!/usr/bin/env sh
# Resolve 1Password refs into a sourceable localsecrets (values never printed).
set -eu
_repo_root=$(git -C "$(dirname "$0")" rev-parse --show-toplevel 2>/dev/null || pwd)
cd "$_repo_root"
_src="${1:-../op-terraform-creds-bbc.env}"
[ -f "${_src}" ] || { echo "env file not found: ${_src}" >&2; exit 1; }
{
  printf '# generated from %s by op inject — DO NOT COMMIT\n' "${_src}"
  op inject -i "${_src}" | sed 's/^/export /'
} > localsecrets
chmod 600 localsecrets
echo "localsecrets regenerated from ${_src}"
