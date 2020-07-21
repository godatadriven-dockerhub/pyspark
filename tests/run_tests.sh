#!/bin/bash
set -e

for f in /tests/[0-9]*.sh; do
  echo "Running $f"
  bash "$f" -H || (echo "FAILED" && exit 1)
done