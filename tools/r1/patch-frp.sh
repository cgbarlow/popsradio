#!/usr/bin/env bash
# Make a copy of an R1's frp backup with the "OEM unlocking allowed" byte set.
# The flag is the last byte of the frp partition: 00 = not allowed, 01 = allowed.
# This only writes a local file. Writing it to the R1 is a separate step:
#   mtk w frp <out>
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <backup/frp.bin> <out/frp-unlock.bin>" >&2
  exit 1
fi
in=$1 out=$2

cp -- "$in" "$out"
size=$(stat -c %s -- "$out")
last=$(tail -c 1 -- "$out" | od -An -tx1 | tr -d ' ')
echo "Last byte of $in: $last"
if [[ $last == 01 ]]; then
  echo "Already allowed; $out is an unchanged copy."
  exit 0
fi
printf '\x01' | dd of="$out" bs=1 seek=$((size - 1)) conv=notrunc status=none
echo "Wrote $out with the last byte set to 01. Differences from the backup (offset, old, new):"
cmp -l -- "$in" "$out" || true
