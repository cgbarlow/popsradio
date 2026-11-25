#!/usr/bin/env bash
# Patch an R1's stock boot image with Magisk over adb, without tapping through the app.
# Uses boot_patch.sh and the binaries from inside the official Magisk APK.
#
# Usage: magisk-patch.sh <Magisk-vX.apk> <stock boot_<slot>.bin> <out.img>
# Needs: the R1 booted into Android with adb working. Writes only to /data/local/tmp/magisk.
# Then flash it yourself: adb reboot bootloader && fastboot flash boot_<slot> <out.img> && fastboot reboot
set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "Usage: $0 <Magisk-vX.apk> <stock boot_<slot>.bin> <out.img>" >&2
  exit 1
fi
apk=$1 boot=$2 out=$3
kit=$(mktemp -d)
trap 'rm -rf "$kit"' EXIT

python3 -I - "$apk" "$kit" <<'EOF'
import sys, zipfile
z = zipfile.ZipFile(sys.argv[1]); d = sys.argv[2]
files = {
    "assets/boot_patch.sh": "boot_patch.sh",
    "assets/util_functions.sh": "util_functions.sh",
    "lib/arm64-v8a/libmagiskinit.so": "magiskinit",
    "lib/arm64-v8a/libmagisk.so": "magisk",
    "lib/arm64-v8a/libmagiskboot.so": "magiskboot",
    "lib/arm64-v8a/libinit-ld.so": "init-ld",
}
for src, dst in files.items():
    open(f"{d}/{dst}", "wb").write(z.read(src))
EOF
cp -- "$boot" "$kit/boot.img"

adb shell 'rm -rf /data/local/tmp/magisk && mkdir -p /data/local/tmp/magisk'
adb push -q "$kit/." /data/local/tmp/magisk/
# KEEPVERITY/KEEPFORCEENCRYPT=true match what the Magisk app picks for an A/B, encrypted device.
# PATCHVBMETAFLAG=false because the runbook already flashed vbmeta with verification off.
adb shell 'cd /data/local/tmp/magisk && chmod 755 boot_patch.sh magiskinit magisk magiskboot init-ld &&
  KEEPVERITY=true KEEPFORCEENCRYPT=true PATCHVBMETAFLAG=false sh ./boot_patch.sh boot.img'
adb pull /data/local/tmp/magisk/new-boot.img "$out"
adb shell 'rm -rf /data/local/tmp/magisk'

python3 -I -c "
import sys
d = open(sys.argv[1], 'rb').read(8)
sys.exit(0 if d == b'ANDROID!' else 'Patched image has no ANDROID! header')
" "$out"
echo "Patched image: $out"
sha256sum -- "$boot" "$out"
