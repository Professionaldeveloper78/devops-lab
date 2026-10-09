#!/usr/bin/env bash
set -euo pipefail

count=0

bad_counter() {
  local count=99
}

good_counter() {
  local count=99
  echo "inside good_counter: count=$count"
}

echo "before      : count=$count"
bad_counter
echo "after bad   : count=$count"
good_counter
echo "after good  : count=$count"
line_count() {
  wc -l < "$1"
}

file_ok() {
  [ -f "$1" ]
}

n=$(line_count src/greeting.txt)
echo "greeting.txt has $n lines"

if file_ok src/nothing.txt; then
  echo "found it"
else
  echo "missing — exit code $?"
fi
