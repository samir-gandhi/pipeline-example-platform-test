#!/usr/bin/env python3
# Serve the sample app over HTTPS for the demo. Requires terraform apply to
# have generated sample-app/global.js first.
#
# Why not `openssl s_server -WWW`: it has no directory-index handling, so a
# request to "/" fails with "Error opening ''". This serves index.html at
# "/" like a normal web server.
#
# Usage: scripts/demo/serve_app.sh [--port 8080]

import argparse
import functools
import http.server
import os
import ssl
import sys

_default_port = 8080

parser = argparse.ArgumentParser()
parser.add_argument("--port", type=int, default=_default_port)
args = parser.parse_args()

_repo_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
app_dir = os.path.join(_repo_root, "sample-app")

if not os.path.isfile(os.path.join(app_dir, "global.js")):
    print("global.js missing; run: source localsecrets && terraform -chdir=terraform apply first", file=sys.stderr)
    sys.exit(1)

cert = os.path.join(app_dir, "certs", "cert.pem")
key = os.path.join(app_dir, "certs", "key.pem")

handler = functools.partial(http.server.SimpleHTTPRequestHandler, directory=app_dir)
httpd = http.server.ThreadingHTTPServer(("127.0.0.1", args.port), handler)
ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
ctx.load_cert_chain(cert, key)
httpd.socket = ctx.wrap_socket(httpd.socket, server_side=True)

print(f"Serving https://127.0.0.1:{args.port} (certs/ from repo)")
print("Open https://127.0.0.1:8080 in a browser (accept the self-signed cert warning).")
try:
    httpd.serve_forever()
except KeyboardInterrupt:
    pass
