#!/usr/bin/env bash
# Give a flashed R1 a simple home screen until our own app replaces it:
# Olauncher (F-Droid, no widgets, so it doesn't hit the missing AppWidgetService
# that makes Trebuchet crash-loop) with one app on it: Zello. Settings, brightness
# and the power menu (switch off, restart) are in Quick Settings: swipe down twice.
#
# Usage: home-launcher.sh <adb serial>
# Needs: root over adb (Magisk, Shell granted). Undo: adb shell pm uninstall app.olauncher
set -euo pipefail
serial=${1:?Usage: $0 <adb serial>}
adb=(adb -s "$serial")
apk="$HOME/r1-backups/apks/olauncher.apk"
url="https://f-droid.org/repo/app.olauncher_114.apk"           # v6.10.27
sha="27d02910287065256f2e4df8cbf28fc7cbfa6c865294d5773158b633f250bdb8"

mkdir -p "$(dirname "$apk")"
[[ -f $apk ]] || curl -fsSL -o "$apk" "$url"
echo "$sha  $apk" | sha256sum -c --quiet

"${adb[@]}" install -r "$apk"
"${adb[@]}" shell cmd role add-role-holder android.app.role.HOME app.olauncher 0
# Start it once so its data folder exists, then stop it before writing its settings.
"${adb[@]}" shell input keyevent KEYCODE_HOME
sleep 3
"${adb[@]}" shell am force-stop app.olauncher

prefs=$(cat <<'EOF'
<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
<map>
    <int name="HOME_APPS_NUM" value="1" />
    <boolean name="FIRST_OPEN" value="false" />
    <boolean name="FIRST_SETTINGS_OPEN" value="false" />
    <int name="SHOW_HINT_COUNTER" value="2" />
    <string name="APP_NAME_1">Zello</string>
    <string name="APP_PACKAGE_1">com.loudtalks</string>
    <string name="APP_ACTIVITY_CLASS_NAME_1">com.zello.ui.MainActivity</string>
    <string name="APP_USER_1">UserHandle{0}</string>
    <boolean name="IS_SHORTCUT_1" value="false" />
</map>
EOF
)
dir=/data/data/app.olauncher
f=$dir/shared_prefs/app.olauncher.xml
"${adb[@]}" shell su -c "'mkdir -p $dir/shared_prefs && cat > $f && chown -R \$(stat -c %u:%g $dir) $dir/shared_prefs && chmod 660 $f && chmod 771 $dir/shared_prefs && restorecon -R $dir/shared_prefs >/dev/null 2>&1'" <<<"$prefs"

"${adb[@]}" shell input keyevent KEYCODE_HOME
sleep 3
echo "Home role: $("${adb[@]}" shell cmd role get-role-holders android.app.role.HOME)"
"${adb[@]}" shell uiautomator dump /sdcard/ui.xml >/dev/null 2>&1
echo "Home screen apps: $("${adb[@]}" shell cat /sdcard/ui.xml | grep -oE 'text="[^"]*" resource-id="app.olauncher:id/homeApp[0-9]"' | grep -oE 'text="[^"]*"' | tr '\n' ' ')"
