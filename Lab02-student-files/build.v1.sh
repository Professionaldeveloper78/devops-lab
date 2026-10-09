#!/usr/bin/env bash
# build.v1.sh — Lab 01's build.sh, provided as a fallback only.
#
# Use YOUR OWN build.sh from last week if you still have it. This copy
# exists so that nobody is blocked in Lab 02 by a lost file.
#
# Usage:  bash build.v1.sh [input-file]     (default: app.txt)
# Exits 0 when all three stages pass, non-zero at the first failure.
#
# Read it before you run it. Lab 02 asks you to explain what it does
# badly — it rebuilds everything, every time, however little changed.

set -euo pipefail

SRC="${1:-app.txt}"

log() { printf '[%s] %s\n' "$(date +%H:%M:%S)" "$*"; }

stage_check() {
  log "STAGE 1: checking prerequisites"
  if [ ! -f "$SRC" ]; then
    log "ERROR: source file '$SRC' not found"
    return 1
  fi
  log "found $SRC ($(wc -l < "$SRC") lines)"
}

stage_build() {
  log "STAGE 2: building"
  mkdir -p build
  tr '[:lower:]' '[:upper:]' < "$SRC" > build/output.txt
  log "wrote build/output.txt"
}

stage_test() {
  log "STAGE 3: testing"
  if grep -q '[a-z]' build/output.txt; then
    log "TEST FAILED: lowercase characters remain"
    return 1
  fi
  log "TEST PASSED"
}

stage_check
stage_build
stage_test
log "BUILD SUCCEEDED"
