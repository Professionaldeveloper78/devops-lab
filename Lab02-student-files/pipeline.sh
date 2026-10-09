#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="${1:-src}"
OUT_DIR="${2:-out}"

usage() {
    cat <<'EOF'
Usage: pipeline.sh [SRC_DIR] [OUT_DIR]

Uppercases every .txt file in SRC_DIR into OUT_DIR.

SRC_DIR   directory of .txt inputs   (default: src)
OUT_DIR   directory for outputs      (default: out)

Exit codes: 0 success, 1 missing input, 2 test failure, 64 bad usage.
EOF
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
    usage
    exit 0
fi

if [ $# -gt 2 ]; then
    echo "error: too many arguments" >&2
    usage >&2
    exit 64
fi

log() {
    printf '[%s] %-5s %s\n' "$(date +%H:%M:%S)" "$1" "${*:2}"
}

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

if [ ! -d "$SRC_DIR" ]; then
    log ERROR "cannot read $SRC_DIR"
    exit 1
fi

mkdir -p "$OUT_DIR"

files=("$SRC_DIR"/*.txt)

if [ ! -e "${files[0]}" ]; then
    log WARN "no test files found"
    exit 0
fi

log INFO "starting"
log INFO "processing ${#files[@]} file(s)"

for file in "${files[@]}"; do
    name="${file##*/}"
    output="$OUT_DIR/$name"

    tr '[:lower:]' '[:upper:]' < "$file" > "$TMP/$name"
    mv "$TMP/$name" "$output"

    log INFO "created $output"
done

log INFO "PIPELINE COMPLETED SUCCESSFULLY "
