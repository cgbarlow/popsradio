#!/usr/bin/env bash
# Live progress view for an mtkclient R1 backup (mtk rl --skip userdata <dir>).
# Run it in a second terminal. Usage: watch-backup.sh <backup-dir> [mtk-log]
# Pass the mtk log (mtk ... > log 2>&1) to also see the current partition.
# Ctrl+C closes the viewer only; the backup keeps going.
DIR="${1:?Usage: $0 <backup-dir> [mtk-log]}"
LOG="${2:-/dev/null}"
# Whole R1 eMMC minus userdata, from its partition table (0x1d1ec00000 - 0x1adc0f8000)
TOTAL=$(( 0x1d1ec00000 - 0x1adc0f8000 ))
W=40
prev=$(du -sb "$DIR" 2>/dev/null | cut -f1); prev=${prev:-0}; prev_t=$(date +%s.%N); rate=0
tput civis; trap 'tput cnorm; echo; exit' INT TERM
clear
while true; do
  now=$(du -sb "$DIR" 2>/dev/null | cut -f1); now=${now:-0}
  t=$(date +%s.%N)
  inst=$(awk -v a="$now" -v b="$prev" -v t1="$t" -v t0="$prev_t" 'BEGIN{d=t1-t0; if(d>0) printf "%.1f", (a-b)/d/1048576; else print 0}')
  rate=$(awk -v r="$rate" -v i="$inst" 'BEGIN{printf "%.1f", (r==0)?i:0.7*r+0.3*i}')
  prev=$now; prev_t=$t
  pct=$(( now * 100 / TOTAL )); (( pct > 100 )) && pct=100
  fill=$(( pct * W / 100 ))
  bar=$(printf '%*s' "$fill" '' | tr ' ' '#')$(printf '%*s' $((W - fill)) '' | tr ' ' '.')
  part=$(grep -ao 'Dumping partition [^ ]*' "$LOG" 2>/dev/null | tail -1 | awk '{print $3}')
  done_n=$(grep -ac 'Dumped partition' "$LOG" 2>/dev/null)
  eta=$(awk -v r="$rate" -v left=$((TOTAL - now)) 'BEGIN{ if(r>0.5){s=left/(r*1048576); printf "%dm %02ds", s/60, s%60} else print "--"}')
  status="copying"
  if ! pgrep -f 'mtk rl' >/dev/null; then
    if grep -aqiE 'error|exception|traceback' "$LOG" 2>/dev/null; then status="STOPPED - check the log"; else status="FINISHED"; fi
  fi
  tput cup 0 0
  printf '  R1 backup  ->  %s\n\n' "$DIR"
  printf '  [%s] %3d%%\n\n' "$bar" "$pct"
  printf '  Saved:      %6.2f / %.2f GB\033[K\n' "$(awk -v n="$now" 'BEGIN{print n/1e9}')" "$(awk -v n="$TOTAL" 'BEGIN{print n/1e9}')"
  printf '  Speed:      %s MB/s\033[K\n' "$rate"
  printf '  Time left:  %s\033[K\n' "$eta"
  printf '  Partition:  %s  (%s done)\033[K\n' "${part:--}" "${done_n:-0}"
  printf '  Status:     %s\033[K\n\n' "$status"
  printf '  Ctrl+C to close (this only closes the viewer, the backup keeps going)\033[K\n'
  [[ $status != copying ]] && break
  sleep 1
done
tput cnorm
