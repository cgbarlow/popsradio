# R1 Flashing Runbook

Nov 25, 2026 · @Chris Barlow

## Summary

This is how we take a Rabbit R1 from stock rabbitOS to our own Android, step by step, on a Linux laptop. It is written from doing it on R1 "A", so every command here has been run and worked, through to LineageOS booting.

| Step | What | R1 "A" | R1 "B" |
|---|---|---|---|
| 0 | Install the tools | Done | Same laptop, done |
| 1 | Back up every partition except user data | Done, checked | To do |
| 2 | Allow unlocking (flip the `frp` byte) | Done | To do |
| 3 | Get into fastboot | Done | To do |
| 4 | Unlock the bootloader and wipe | Done | To do |
| 5 | Flash LineageOS | Done, boots | To do |
| 6 | Root with Magisk, read the button scancodes | Next | To do |

The scripts are in [`tools/r1/`](../tools/r1). The backups are not in the repo and must never be: they hold each R1's IMEI and Wi-Fi calibration.

The background, and why we reflash at all, is in the [R1 doc](Rabbit%20R1%20Walkie-Talkie%20Research%20and%20Design.md#getting-control-of-the-r1).

## The one thing to know first

**The R1 only talks to `mtk` for a moment as it powers up.** It has no volume buttons, so there is no button combination for flashing mode. Every `mtk` command works the same way:

1. Start the command. It says it is waiting.
2. Unplug the R1 and switch it fully off. Hold the side button for about 10 seconds if unsure.
3. Plug it straight into the laptop, not through a hub, without pressing anything.

**To switch the R1 off, press the side button quickly 8 times** ([Rabbit support](https://www.rabbit.tech/support/article/use-rabbit-r1)). Holding it only wakes it, and works even when rabbitOS wants activating. Do it *unplugged*. If it powers off while plugged in, it drops into charging mode (`0e8d:20ff`) without passing through the preloader, so unplug and plug in again. A booted rabbitOS shows as `0e8d:2304 r1`. Once unlocked, it boots with an "unlocked, can't be trusted" warning, which is normal.

A plugged-in R1 that is off sits on the USB bus as `0e8d:2000 MT65xx Preloader`, but that connection has gone quiet. Each new command needs a fresh plug-in. If `mtk` keeps saying "Handshake failed, retrying", that is what has happened: replug.

## 0. Tools

On Arch (Omarchy), once per laptop:

```
sudo pacman -S --needed android-tools
uv tool install git+https://github.com/bkerler/mtkclient
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", MODE="0666", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/52-mtk.rules
sudo udevadm control --reload && sudo udevadm trigger
```

We used mtkclient 2.1.4. The udev rule is from [frogmoses/rabbit-r1](https://github.com/frogmoses/rabbit-r1). ModemManager and brltty, which can grab MediaTek devices, weren't running; check with `systemctl is-active ModemManager brltty`.

**The serial driver, `cdc_acm`, matters.** It loads itself whenever the R1 is plugged in and holds the R1 as `/dev/ttyACM0`.

- For `mtk` (steps 1 and 2) it must be **unloaded**: `sudo modprobe -r cdc_acm`.
- For the fastboot script (step 3) it must be **loaded**: `sudo modprobe cdc_acm`, or just plug in, since it loads itself.

Commands that need `sudo` have to run in a normal terminal. Claude Code's `!` prompt can't ask for a password.

## 1. Back up

```
sudo modprobe -r cdc_acm
mtk rl --skip userdata ~/r1-backups/r1-A
```

Then replug the R1 as above. It reads at about 20 MB/s: 46 partitions, 9.1 GB, about 8 minutes. To watch it, run this in a second terminal:

```
mtk rl --skip userdata ~/r1-backups/r1-A > ~/r1-backups/r1-A.log 2>&1   # instead of the plain command
tools/r1/watch-backup.sh ~/r1-backups/r1-A ~/r1-backups/r1-A.log
```

Then check it and save checksums:

- `mtk printgpt` gives each partition's length. Every `.bin` file should be exactly that size. On R1 "A" all 46 matched.
- `nvram.bin`, `nvdata.bin` and `proinfo.bin` must not be all zeros. They hold the IMEI and calibration, and are the only things you can't get back from anywhere else.
- `cd ~/r1-backups/r1-A && sha256sum *.bin > SHA256SUMS`

Label the R1 with the same letter as its backup folder.

**Back up the preloader too.** `mtk rl` only reads the main area, not the eMMC boot area that holds the preloader:

```
mtk r boot1 ~/r1-backups/r1-A/boot1.bin --parttype boot1   # read-only; 4 MB, starts with "EMMC_BOOT"
```

Use `mtk r`, never `mtk e`, which also accepts `boot1` and would erase it.

## 2. Allow unlocking

"OEM unlocking allowed" is the last byte of the `frp` partition: `00` is no, `01` is yes. This is how [r1_escape](https://github.com/RabbitHoleEscapeR1/r1_escape) does it, rather than mtkclient's own `da seccfg unlock`.

```
tools/r1/patch-frp.sh ~/r1-backups/r1-A/frp.bin ~/r1-backups/work-A/frp-unlock.bin
sudo modprobe -r cdc_acm
mtk w frp ~/r1-backups/work-A/frp-unlock.bin
```

Then replug. It writes 1 MB in a second. To undo it, write the original `frp.bin` back the same way.

## 3. Get into fastboot

The script waits for the preloader and sends it the word `FASTBOOT`, as r1_escape's `mtkbootcmd.py` does. It needs pyserial, which mtkclient's Python already has, and root to open the serial port:

```
sudo ~/.local/share/uv/tools/mtkclient/bin/python -I tools/r1/boot-fastboot.py
```

Follow its prompts: it asks you to unplug, then plug in. The screen then says **FASTBOOT mode**, and `fastboot devices` lists the R1.

Check it is ready to unlock:

```
fastboot getvar unlocked              # unlocked: no
fastboot flashing get_unlock_ability  # non-zero means allowed; R1 "A" said 16777216
```

R1 "A" reported `current-slot: b`, `max-download-size: 0x8000000` (128 MB) and a bootloader dated 2026-07-10, the same day as rabbitOS 2.3.

## 4. Unlock and wipe

**This erases everything on the R1.**

```
fastboot flashing unlock    # "Start unlock flow", OKAY in 3 s; nothing to confirm on the R1
fastboot getvar unlocked    # unlocked: yes
fastboot -w
```

`fastboot -w` reformats user data and erases `metadata`. "Partition not found: cache" is normal, because the R1 has no cache partition.

### Check `seccfg` before flashing

The red "dm-verity corruption" screen in [r1_escape PR #97](https://github.com/RabbitHoleEscapeR1/r1_escape/pull/97) comes from `dm_verity_state=1` in `seccfg`. Read it back after the unlock and check:

```
sudo modprobe -r cdc_acm
mtk r seccfg ~/r1-backups/work-A/seccfg-after-unlock.bin   # leave it waiting...
fastboot reboot                                           # ...and mtk catches the R1 as it restarts
python3 -I -c "import struct,sys; d=open(sys.argv[1],'rb').read(28); print('lock_state=%d dm_verity_state=%d' % struct.unpack('<7I',d)[3:5])" ~/r1-backups/work-A/seccfg-after-unlock.bin
```

`fastboot reboot` saves an unplug: in fastboot the side button won't turn the R1 off.

**You want `lock_state=3 dm_verity_state=0`.** R1 "A" read exactly that after `fastboot flashing unlock` (stock was `1` and `0`), so it needed no fix.

If it says `dm_verity_state=1`, don't flash vbmeta yet. mtkclient 2.1.4's `mtk da seccfg unlock` keeps the existing `dm_verity_state` unless you pass `--critical`, but it refuses to run on an R1 that's already unlocked. So write back the stock `seccfg.bin` from the backup (locked, verity 0), run `mtk da seccfg unlock`, then read it back and check again.

### Build the vbmeta images

Build them from this R1's own active-slot copies, with the flags (bytes 120–123) set to 3 in the file itself. That avoids newer fastboot's "AVB_MAGIC" failure. Trimming each one to its few KB of real data also avoids PR #97's `vbmeta_vendor_a` size problem. On R1 "A", slots `a` and `b` held different firmware, so use the active slot's copies for both slots:

```
mkdir -p ~/r1-backups/work-A/vbmeta-flags3 && cd ~/r1-backups/work-A/vbmeta-flags3
python3 -I - <<'EOF'
for n in ["vbmeta", "vbmeta_system", "vbmeta_vendor"]:
    d = bytearray(open(f"../../r1-A/{n}_b.bin", "rb").read())   # _b = the active slot
    assert d[:4] == b"AVB0"
    end = (len(d.rstrip(b"\0")) + 4095) // 4096 * 4096
    d = d[:end]; d[120:124] = (3).to_bytes(4, "big")
    open(f"{n}.img", "wb").write(d)
EOF
```

## 5. Flash LineageOS

We checked the earlier plan against the live sources on 25 November 2026, and five things changed. Then we ran it on R1 "A", and it booted first time.

**Which image.** `lineage-21.0-20261109-UNOFFICIAL-arm64_bvN.img.gz` from the `lineage-21-pre-qpr2-td` folder of [Andy Yan's GSIs](https://sourceforge.net/projects/andyyan-gsi/files/), about 1.2 GB.

- `bvN` means A/B, vanilla (no Google apps) and no built-in superuser. Our app is sideloaded and Magisk comes later, so we want neither Google apps (`g`) nor the built-in superuser (`S`), which fights Magisk. The earlier plan said `bgN`, following [Doug Belshaw](https://substrate.dougbelshaw.com/rabbit-r1-android).
- Not `vndklite`: the R1's vendor has a full VNDK.
- [robotOS](https://github.com/windoze95/robotOS) ran a `pre-qpr2-td` `bvN` build on an R1 in October 2026. Nobody has reported this exact 9 November build yet.
- The fallback is the one [Croissant C1](https://github.com/benyscott/croissant-c1) tested end to end: `lineage-20.0-20251021-UNOFFICIAL-arm64_bvN.img.gz` from `lineage-20-td`.
- No Android 15 or later GSI has been reported working on an R1.

**Turn verification off on all three vbmeta images, both slots,** not just one, as robotOS does. Use this R1's own images from its backup, since there is no public 2.x stock image to take them from.

**Read the slot from fastbootd, not the bootloader.** Croissant found the bootloader's `current-slot` was wrong on one unit, and **R1 "A" had the same problem.** The bootloader said `b`, but fastbootd said `a`, and fastbootd was right: `super` held only `system_a`, `vendor_a` and `product_a`, and Android then booted with `ro.boot.slot_suffix=_a`. Flash `system_<slot>` explicitly, using the slot fastbootd reports. Check with `fastboot getvar all | grep is-logical` that the `_<slot>` partitions exist.

**Cancel any pending update first** with `fastboot snapshot-update cancel`.

**`-S 100M` is optional.** Neither 2026 installer uses it, but it's harmless.

The sequence:

```
# bootloader fastboot
cd ~/r1-backups/work-A/vbmeta-flags3
for s in a b; do
  for n in vbmeta vbmeta_system vbmeta_vendor; do fastboot flash ${n}_$s $n.img; done
done
fastboot erase userdata
fastboot erase md_udc          # the real /metadata; stale keys here stop /data mounting
fastboot reboot fastboot

# fastbootd
fastboot getvar is-userspace   # yes = fastbootd is up (R1 "A": within 3 s)
fastboot getvar current-slot   # trust this value (R1 "A": a)
fastboot snapshot-update cancel   # R1 "A" had leftover *-cow partitions
fastboot delete-logical-partition product_<slot>   # optional: removes Rabbit's apps
fastboot -S 100M flash system_<slot> lineage-21.0-20261109-UNOFFICIAL-arm64_bvN.img
fastboot reboot
```

**What happened on R1 "A".**

- The six vbmeta writes went through OK. The two erases printed fastboot's "did you mean to format" warning, which is harmless because Android rebuilds both.
- fastbootd came up straight away. It takes 256 MB at a time (`max-download-size: 0x10000000`), against the bootloader's 128 MB.
- The system image went in 25 pieces, in 2 minutes 11 seconds. fastbootd grew `system_a` from 1.6 GB to exactly the image's 2.55 GB.
- We skipped `delete-logical-partition product_a` on this first flash.
- After `fastboot reboot`, it showed as `0e8d:2303 TrebleDroid vanilla` within 75 seconds. Android reported `sys.boot_completed=1` about 40 seconds after that, landing in the Lineage setup wizard. `adb` worked straight away with no authorisation prompt, because it's a `userdebug` build.
- What it reported: Android 14, security patch 2026-11-01, `verifiedbootstate=orange` (unlocked), screen 480×640 at 320 dpi, Wi-Fi on, and 103 GB free in `/data`.
- Input devices: `mtk-tpd` (touch), `mtk-pmic-keys`, `mtk-kpd`, `och1970_holl_key` (probably the hall-sensor wheel) and `mt63xx-accdet` (headset).
- The only crash was Lineage's music app, Eleven: `AppWidgetManager` is null, the known missing-AppWidgetService problem. It's harmless for us.

**Known risks for this step:**

- **"Failed to find AVB_MAGIC".** Some recent fastboot versions fail the `--disable-verity` edit. Building the images with the flags already set avoids it.
- **A red "dm-verity corruption" screen and no fastbootd.** [r1_escape PR #97](https://github.com/RabbitHoleEscapeR1/r1_escape/pull/97) reports this on rabbitOS 2.3.1 when `seccfg` has `dm_verity_state=1`. Checking `seccfg` first, as in step 4, rules out that cause.
- **The home screen crash-loops.** Lineage's launcher needs AppWidgetService, which some builds lack. That doesn't matter for us: our app becomes the home screen, and Croissant disables `com.android.launcher3`.

## 6. Afterwards

**Trebuchet, Lineage's home screen, crash-loops** on the missing AppWidgetService, as expected. Turn it off; our app will be the home screen:

```
adb shell pm disable-user --user 0 com.android.launcher3   # undo: adb shell pm enable com.android.launcher3
```

The R1 then shows Android's placeholder home, "Device is starting…", which is fine. Open anything else over adb, for example `adb shell am start -a android.settings.SETTINGS`. If `adb devices` goes empty while the R1 is still on USB, run `adb kill-server` and try again.

**Buttons and wheel, read on R1 "A" with `adb shell getevent -lt`:**

| Control | Device | Code | Android key | Notes |
|---|---|---|---|---|
| Side button | `mtk-kpd` (`event0`) | 116 `KEY_POWER` | `POWER` | A hold gives one down, then one up when released, so it suits push-to-talk. Not `mtk-pmic-keys`, which also claims `KEY_POWER` but never fired |
| Wheel up | `och1970_holl_key` (`event2`) | 103 `KEY_UP` | `DPAD_UP` | Hall-sensor wheel. About 23 steps for one felt click, so count events, not clicks |
| Wheel down | `och1970_holl_key` (`event2`) | 108 `KEY_DOWN` | `DPAD_DOWN` | |
| Touch | `mtk-tpd` (`event3`) | `BTN_TOUCH` | touch | Still worked after a short screen-off |

There is no `mtk-kpd.kl`, so Android uses `Generic.kl`. The push-to-talk remap is a new `mtk-kpd.kl` that maps 116 to something other than `POWER`, and it needs root.

- Root with Magisk.
- **Device Owner needs a Magisk module.** The R1's vendor doesn't declare `android.software.device_admin`, so `dpm set-device-owner` is refused. Croissant ships a module that adds `/system/etc/permissions/android.software.device_admin.xml`.
- Never run `adb root`. frogmoses found it re-enumerates USB and killed touch.
- Touch dying after the screen turns off, and the side button not waking the R1 from deep sleep, are reported on CipherOS. Nobody has checked on Lineage yet.

## Getting back to stock

Write the backup back with `mtk wl ~/r1-backups/r1-A`, then replug. The official [firmware archive](https://github.com/rabbit-hmi-oss/firmware) is still up but stops at v0.8.293 (May 2025), so your own backup is the only copy of the 2.x firmware you have.
