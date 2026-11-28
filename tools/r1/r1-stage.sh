#!/usr/bin/env bash
# Record a stage's status for r1-monitor.sh.
# Usage: r1-stage.sh <unit> <stage> <status> [note...]
#   status: pending | waiting (needs you) | running | done | failed | skipped
# Example: r1-stage.sh B backup running "copying partitions"
set -euo pipefail
unit=${1:?unit}; stage=${2:?stage}; status=${3:?status}; shift 3
note="$*"
state="$HOME/r1-backups/r1-$unit.state"
touch "$state"
tmp=$(mktemp)
grep -v "^$stage	" "$state" > "$tmp" || true
printf '%s\t%s\t%s\t%s\n' "$stage" "$status" "$(date +%s)" "$note" >> "$tmp"
mv "$tmp" "$state"
