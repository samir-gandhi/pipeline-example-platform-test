#!/usr/bin/env bash
# Onboard a new child business repo + PingOne environment + sample app.
#
# Usage: ./scripts/onboard_child.sh <business-name> [branch]
#   business-name : lowercase alphanumeric (used for repo, env, host, bucket)
#   branch        : branch to push after onboarding (default: onboarding)
#
# What it does:
#   1. Copies templates/child/ into a scratch dir, stamps the business name
#   2. Creates private repo pipeline-example-brand-<name>, pushes prod + qa
#   3. Sets TERRAFORM_ENV_BASE64 from localsecrets with a child state prefix
#      (requires 1Password: op run --env-file=<org creds file>)
#   4. Pushes the onboarding branch -> provision workflow creates the child's
#      PingOne environment (from the parent's pinned baseline module) and the
#      branded sample app at <name>-onboarding-demo.pingdevops.com
#
# Requires: gh (authed as repo owner), git, op (only for the secret step).

set -eu

_usage() {
  printf '%s\n' "Usage: $0 <business-name> [branch]"
  exit 2
}

_business="${1:-}"
_branch="${2:-onboarding}"
case "$_business" in
  ""|*[!a-z0-9-]*) _usage ;;
esac

_repo_root=$(git rev-parse --show-toplevel)
_parent_repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
_org="${_parent_repo%%/*}"
_child_repo="pipeline-example-brand-${_business}"
_template="${_repo_root}/templates/child"
_work="${TMPDIR:-/tmp}/onboard-${_business}-$$"
_suffix_env_file="${ONBOARD_CHILD_CREDS_ENV:-${_repo_root}/../op-terraform-creds-ingr.env}"

[ -d "$_template" ] || { echo "template dir missing: $_template" >&2; exit 1; }
[ -f "$_suffix_env_file" ] || {
  echo "org 1Password env file not found: $_suffix_env_file" >&2
  echo "set ONBOARD_CHILD_CREDS_ENV to the op:// env file for this org" >&2
  exit 1
}
gh repo view "${_org}/${_child_repo}" >/dev/null 2>&1 && {
  echo "repo ${_org}/${_child_repo} already exists" >&2; exit 1; }

command -v gh >/dev/null && command -v op >/dev/null || {
  echo "gh and op are required" >&2; exit 1; }

echo "==> Stamping template for '${_business}' into ${_work}"
cp -R "$_template" "$_work"
grep -rl '__BUSINESS__' "$_work" | xargs sed -i '' "s/__BUSINESS__/${_business}/g"
rm -rf "${_work}/sample-app/global.js"   # generated per environment

echo "==> Creating repo ${_org}/${_child_repo} (private)"
cd "$_work"
# Push over HTTPS with gh's credential helper — avoids needing an SSH key
# in the agent (gh auth status works even when git@github.com doesn't).
git init -q -b prod
git config credential.helper '!gh auth git-credential'   # local to this repo
git add -A
git commit -q -m "${_business} child business: baseline module + branding + sample app"
gh repo create "${_org}/${_child_repo}" --private --source=. --remote=origin >/dev/null
git remote set-url origin "https://github.com/${_org}/${_child_repo}.git"
git push -q -u origin prod

git branch -q qa && git push -q origin qa

echo "==> Setting pipeline secret (child state prefix)"
op run --env-file="$_suffix_env_file" -- bash -c '
  set -eu
  _root="'"${_repo_root}"'"
  source "${_root}/localsecrets"
  { grep -v "TF_VAR_tf_state_key_prefix" "${_root}/localsecrets"
    printf "export TF_VAR_tf_state_key_prefix=\"%s/brands/%s\"\n" \
      "$TF_VAR_tf_state_key_prefix" "'"${_business}"'"; } > "'"${_work}"'/child-localsecrets"'
gh secret set --app actions TERRAFORM_ENV_BASE64 \
  --body "$(base64 -i "${_work}/child-localsecrets" | tr -d '\n')"
rm -f "${_work}/child-localsecrets"

echo "==> Pushing branch '${_branch}' (provisions environment + sample app)"
git checkout -q -b "$_branch"
git push -q -u origin "$_branch"

echo
echo "Onboarding kicked off:"
echo "  repo     https://github.com/${_org}/${_child_repo}"
echo "  watch    https://github.com/${_org}/${_child_repo}/actions"
echo "  app      https://${_business}-${_branch}-demo.pingdevops.com (once Deploy lands, ~8-10 min)"
echo "scratch    ${_work} (safe to delete)"