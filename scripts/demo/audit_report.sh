#!/usr/bin/env sh
# Compile a demo audit trail report for a rollback/remediation incident.
# Usage: scripts/demo/audit_report.sh [--branch <branch>] [--since <date>]
#
# Collects GitHub Actions runs, PRs, and commits for the incident window and
# writes a Markdown evidence report to stdout (redirect to a file).

set -eu

_branch=""
_since=$(date -v-1d '+%Y-%m-%dT%H:%M:%SZ')

_usage() {
  printf '%s\n' "Usage: $0 [--branch <branch>] [--since <ISO8601 date>]"
  exit 2
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --branch) [ "$#" -ge 2 ] || _usage; _branch="$2"; shift 2 ;;
    --since) [ "$#" -ge 2 ] || _usage; _since="$2"; shift 2 ;;
    -h|--help) _usage ;;
    *) _usage ;;
  esac
done

_repo_root=$(git rev-parse --show-toplevel 2>/dev/null) || exit 1
cd "${_repo_root}"
_repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner 2>/dev/null)
[ -n "${_repo}" ] || { echo "gh not authenticated or repo not found" >&2; exit 1; }
[ -n "${_branch}" ] || _branch=$(git rev-parse --abbrev-ref HEAD)

echo "# Demo Audit Trail: ${_repo} (${_branch})"
echo ""
echo "Window: ${_since} → $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
echo ""

echo "## Commits (chronological)"
echo ""
echo "| SHA | Date | Author | Message |"
echo "|-----|------|--------|---------|"
git log --since="${_since}" --format='| %h | %ad | %an | %s |' --date=short --reverse
echo ""

echo "## Pull Requests"
echo ""
echo "| PR | Title | Merged | URL |"
echo "|----|-------|--------|-----|"
gh pr list -R "${_repo}" -B "${_branch}" --state merged --limit 10 --json number,title,mergedAt,url \
  --jq '.[] | "#\(.number) | \(.title) | \(.mergedAt) | \(.url)"' 2>/dev/null | sed 's/^#/#/; s/ | / | /g; s/^/| /; s/$/ |/'
echo ""

echo "## GitHub Actions Runs"
echo ""
echo "| Workflow | Branch | Event | Conclusion | Started | URL |"
echo "|----------|--------|-------|------------|---------|-----|"
gh run list -R "${_repo}" -b "${_branch}" --limit 20 --created ">${_since}" \
  --json name,headBranch,event,conclusion,createdAt,url \
  --jq '.[] | "\(.name) | \(.headBranch) | \(.event) | \(.conclusion) | \(.createdAt) | \(.url)"' 2>/dev/null \
  | awk -F'|' '{print "|"$0"|"}'
echo ""

echo "## Tags (approved releases)"
echo ""
git tag -l | tail -5 | while read -r _tag; do
  printf -- '- %s → %s\n' "${_tag}" "$(git rev-parse --short "${_tag}" 2>/dev/null)"
done
echo ""
echo "## Verification"
echo ""
echo "Resource validation output (scripts/demo/validate_resources.sh --env ${_branch}):"
echo '```'
echo "(run manually and paste output here)"
echo '```'
