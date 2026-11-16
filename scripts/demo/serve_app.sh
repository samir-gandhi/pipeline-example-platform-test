#!/usr/bin/env sh
# Serve the sample app over HTTPS for the demo. Requires terraform apply to
# have generated sample-app/global.js first.
# Usage: scripts/demo/serve_app.sh [--port 8443]

set -eu

_port="8443"
[ "${1:-}" = "--port" ] && { _port="$2"; }

_repo_root=$(git rev-parse --show-toplevel)
cd "${_repo_root}/sample-app"

[ -f global.js ] || {
  echo "global.js missing; run: source localsecrets && terraform -chdir=terraform apply first" >&2
  exit 1
}

echo "Serving https://127.0.0.1:${_port} (certs/ from repo)"
echo "Open https://127.0.0.1:${_port} in a browser (accept the self-signed cert warning)."
exec openssl s_server -WWW -quiet \
  -cert certs/cert.pem -key certs/key.pem \
  -accept "${_port}"
