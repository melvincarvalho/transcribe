#!/bin/bash
# Serve with COEP/COOP headers required for WebGPU + SharedArrayBuffer
# Usage: ./serve.sh [port]
PORT=${1:-8080}
echo "Serving at http://localhost:$PORT"
python3 -c "
from http.server import HTTPServer, SimpleHTTPRequestHandler
import sys

class Handler(SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Cross-Origin-Opener-Policy', 'same-origin')
        self.send_header('Cross-Origin-Embedder-Policy', 'credentialless')
        self.send_header('Cross-Origin-Resource-Policy', 'cross-origin')
        super().end_headers()

HTTPServer(('', $PORT), Handler).serve_forever()
"
