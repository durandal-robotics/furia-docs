#!/bin/bash
# Automated screenshot capture for Furia docs.
# Run after starting the backend services (interop-gateway on :3226, market on :3030).
set -euo pipefail
echo "=== Capturing screenshots ==="
cd "$(dirname "$0")/.."
python3 scripts/capture-screenshots.py
echo "=== Done ==="
