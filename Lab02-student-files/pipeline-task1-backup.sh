#!/usr/bin/env bash
set -euo pipefail
 
SRC_DIR="${1:-src}"
OUT_DIR="${2:-out}"
 
usage() {
  cat <<'EOF'
Usage: pipeline.sh [SRC_DIR] [OUT_DIR]
 
  Uppercases every .txt file in SRC_DIR into OUT_DIR.
 
  SRC_DIR   directory of .txt inputs   (default: src)
  OUT_DIR   directory for outputs      (default: build)
 
Exit codes: 0 success, 1 missing input, 2 test failure, 64 bad usage.
EOF
}
 
if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage; exit 0
fi
 
if [ $# -gt 2 ]; then
  echo "error: too many arguments" >&2
  usage >&2
  exit 64
fi
