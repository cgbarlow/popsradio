#!/usr/bin/env bash
# Live dashboard for prepping one R1, following docs/R1 Flashing Runbook.md.
# Usage: r1-monitor.sh <unit>        e.g. r1-monitor.sh B
#
# Stage statuses come from ~/r1-backups/r1-<unit>.state (written by r1-stage.sh).
# Live detail comes from the stage logs in ~/r1-backups/logs-<unit>/, the backup
# folder and the R1's USB state. Ctrl+C closes the viewer only.
UNIT=${1:?Usage: $0 <unit letter, e.g. B>}
BASE="$HOME/r1-backups"
STATE="$BASE/r1-$UNIT.state"
LOGS="$BASE/logs-$UNIT"
BACKUP="$BASE/r1-$UNIT"
BACKUP_LOG="$BASE/r1-$UNIT.log"
TOTAL=$(( 0x1d1ec00000 - 0x1adc0f8000 ))   # whole eMMC minus userdata, from the R1 partition table
W=30

STAGES=(
  "backup|Back up every partition (mtk rl)"
  "verify|Check backup against partition table"
  "boot1|Back up the preloader (boot1)"
  "frp|Write the frp unlock byte"
  "fastboot|Boot into fastboot"
  "unlock|Unlock bootloader and wipe"
  "seccfg|Check seccfg (dm_verity_state=0)"
  "vbmeta|Flash vbmeta, both slots"
  "fastbootd|Reboot to fastbootd, read slot"
  "system|Flash LineageOS to system_<slot>"
  "firstboot|First boot of LineageOS"
  "launcher|Turn off Trebuchet"
  "magisk|Patch and flash Magisk"
  "grant|Grant root to Shell (in Magisk app)"
  "ptt|Install side-button F9 module"
)

c_reset=$'\e[0m'; c_dim=$'\e[2m'; c_bold=$'\e[1m'
c_green=$'\e[32m'; c_yellow=$'\e[33m'; c_cyan=$'\e[36m'; c_red=$'\e[31m'

bar() {  # bar <done> <total>
  local d=$1 t=$2 pct fill
  (( t > 0 )) || t=1
  pct=$(( d * 100 / t )); (( pct > 100 )) && pct=100
  fill=$(( pct * W / 100 ))
  printf '[%s%s] %3d%%' "$(printf '%*s' "$fill" '' | tr ' ' '#')" "$(printf '%*s' $((W - fill)) '' | tr ' ' '.')" "$pct"
}

usb_mode() {
  local d v p
  for d in /sys/bus/usb/devices/*; do
    [[ -f $d/idVendor && $(cat "$d/removable" 2>/dev/null) != fixed ]] || continue
    v=$(cat "$d/idVendor"); p=$(cat "$d/idProduct")
    case "$v:$p" in
      0e8d:2000) echo "preloader (mtk's link, or a stale one: mtk needs a fresh power-up)"; return ;;
      0e8d:201c) echo "fastboot (bootloader)"; return ;;
      0e8d:20ff) echo "off, charging"; return ;;
      0e8d:2303) echo "Android (LineageOS)"; return ;;
      0e8d:2304) echo "rabbitOS"; return ;;
      18d1:*|0e8d:*) echo "$v:$p $(cat "$d/product" 2>/dev/null)"; return ;;
    esac
  done
  echo "not on USB"
}

last_line() {  # last meaningful line of a log, colour codes and progress spam removed
  [[ -f $1 ]] || return
  sed 's/\x1b\[[0-9;]*m//g' "$1" | tr '\r' '\n' | grep -avE '^\s*$|^\.+$|Progress:|Handshake failed|^Preloader$|^Port - Hint|^Power off|^For (brom|preloader)|^If it is' | tail -1 | cut -c1-70
}

detail() {  # live progress line for a running or waiting stage
  local stage=$1 log="$LOGS/$1.log" now n m part
  case $stage in
    backup)
      now=$(du -sb "$BACKUP" 2>/dev/null | cut -f1); now=${now:-0}
      part=$(grep -ao 'Dumping partition [^ ]*' "$BACKUP_LOG" 2>/dev/null | tail -1 | awk '{print $3}')
      if (( now == 0 )); then echo "waiting for the R1 to power up..."
      else printf '%s %5.2f / %.2f GB  %s' "$(bar "$now" "$TOTAL")" "$(awk -v n="$now" 'BEGIN{print n/1e9}')" "$(awk -v n="$TOTAL" 'BEGIN{print n/1e9}')" "${part:+on $part}"; fi ;;
    system)
      n=$(grep -aoE "Sending sparse '[^']+' [0-9]+/[0-9]+" "$log" 2>/dev/null | tail -1 | grep -oE '[0-9]+/[0-9]+')
      if [[ -n $n ]]; then m=${n#*/}; n=${n%/*}; printf '%s  piece %s of %s' "$(bar "$n" "$m")" "$n" "$m"
      else last_line "$log"; fi ;;
    firstboot)
      if [[ $(timeout 2 adb shell getprop sys.boot_completed 2>/dev/null | tr -d '\r') == 1 ]]; then echo "Android says boot completed"
      elif timeout 2 adb get-state >/dev/null 2>&1; then echo "adb up, Android still starting..."
      else echo "waiting for adb..."; fi ;;
    *)
      if [[ -f $log ]] && grep -aq 'Waiting for PreLoader' "$log" && ! grep -aqE 'Dumped|Wrote|Dumping|Writing' "$log"; then
        echo "waiting for the R1 to power up..."
      else last_line "$log"; fi ;;
  esac
}

fmt_age() { local s=$(( $(date +%s) - $1 )); (( s < 60 )) && echo "${s}s" || echo "$((s / 60))m $((s % 60))s"; }

tput civis; trap 'tput cnorm; echo; exit' INT TERM
clear
while true; do
  out="  ${c_bold}R1 \"$UNIT\" prep${c_reset}   $(date +%T)\n"
  out+="  USB: $(usb_mode)\n\n"
  done_n=0
  for entry in "${STAGES[@]}"; do
    id=${entry%%|*}; title=${entry#*|}
    line=$(grep "^$id	" "$STATE" 2>/dev/null | tail -1)
    status=$(cut -f2 <<<"$line"); since=$(cut -f3 <<<"$line"); note=$(cut -f4- <<<"$line")
    status=${status:-pending}
    case $status in
      done)    icon="${c_green}[done]${c_reset}"; done_n=$((done_n + 1)) ;;
      running) icon="${c_cyan}[ >> ]${c_reset}" ;;
      waiting) icon="${c_yellow}[ YOU]${c_reset}" ;;
      failed)  icon="${c_red}[FAIL]${c_reset}" ;;
      skipped) icon="${c_dim}[skip]${c_reset}"; done_n=$((done_n + 1)) ;;
      *)       icon="${c_dim}[    ]${c_reset}" ;;
    esac
    if [[ $status == pending ]]; then out+="  $icon ${c_dim}$title${c_reset}\n"
    else out+="  $icon $title${since:+  ${c_dim}($(fmt_age "$since") ago)${c_reset}}\n"; fi
    [[ -n $note && $status != pending ]] && out+="         ${c_dim}$note${c_reset}\n"
    if [[ $status == running || $status == waiting ]]; then
      d=$(detail "$id"); [[ -n $d ]] && out+="         $d\n"
    fi
  done
  out+="\n  $done_n of ${#STAGES[@]} stages done.   ${c_dim}Ctrl+C closes this viewer only.${c_reset}\n"
  tput cup 0 0
  printf '%b' "$out" | sed 's/$/\x1b[K/'
  tput ed
  sleep 1
done
