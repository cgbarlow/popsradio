# R1 Flashing Runbook

Nov 25, 2026 · @Chris Barlow

## Summary

This is how we take a Rabbit R1 from stock rabbitOS to our own Android, step by step, on a Linux laptop. It is written from doing it on R1 "A", so every command up to the unlock has been run and worked. The flashing part is a checked plan, not yet run.

| Step | What | R1 "A" | R1 "B" |
|---|---|---|---|
| 0 | Install the tools | Done | Same laptop, done |
| 1 | Back up every partition except user data | Done, checked | To do |
| 2 | Allow unlocking (flip the `frp` byte) | Done | To do |
| 3 | Get into fastboot | Done | To do |
| 4 | Unlock the bootloader and wipe | Done | To do |
| 5 | Flash LineageOS | Next | To do |
| 6 | Root with Magisk, read the button scancodes | Later | To do |

The scripts are in [`tools/r1/`](../tools/r1). The backups are not in the repo and must never be: they hold each R1's IMEI and Wi-Fi calibration.

The background, and why we reflash at all, is in the [R1 doc](Rabbit%20R1%20Walkie-Talkie%20Research%20and%20Design.md#getting-control-of-the-r1).

## The one thing to know first

**The R1 only talks to `mtk` for a moment as it powers up.** It has no volume buttons, so there is no button combination for flashing mode. Every `mtk` command works the same way:

1. Start the command. It says it is waiting.
2. Unplug the R1 and switch it fully off. Hold the side button for about 10 seconds if unsure.
3. Plug it straight into the laptop, not through a hub, without pressing anything.

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

## 5. Flash LineageOS (checked plan, not yet run)

We checked the earlier plan against the live sources on 25 November 2026. Five things changed.

**Which image.** `lineage-21.0-20261109-UNOFFICIAL-arm64_bvN.img.gz` from the `lineage-21-pre-qpr2-td` folder of [Andy Yan's GSIs](https://sourceforge.net/projects/andyyan-gsi/files/), about 1.2 GB.

- `bvN` means A/B, vanilla (no Google apps) and no built-in superuser. Our app is sideloaded and Magisk comes later, so we want neither Google apps (`g`) nor the built-in superuser (`S`), which fights Magisk. The earlier plan said `bgN`, following [Doug Belshaw](https://substrate.dougbelshaw.com/rabbit-r1-android).
- Not `vndklite`: the R1's vendor has a full VNDK.
- [robotOS](https://github.com/windoze95/robotOS) ran a `pre-qpr2-td` `bvN` build on an R1 in October 2026. Nobody has reported this exact 9 November build yet.
- The fallback is the one [Croissant C1](https://github.com/benyscott/croissant-c1) tested end to end: `lineage-20.0-20251021-UNOFFICIAL-arm64_bvN.img.gz` from `lineage-20-td`.
- No Android 15 or later GSI has been reported working on an R1.

**Turn verification off on all three vbmeta images, both slots,** not just one, as robotOS does. Use this R1's own images from its backup, since there is no public 2.x stock image to take them from.

**Read the slot from fastbootd, not the bootloader.** Croissant found the bootloader's `current-slot` was wrong on one unit. Flash `system_<slot>` explicitly.

**Cancel any pending update first** with `fastboot snapshot-update cancel`.

**`-S 100M` is optional.** Neither 2026 installer uses it, but it's harmless.

The sequence:

```
# bootloader fastboot
fastboot flash --disable-verity --disable-verification vbmeta_a        ~/r1-backups/r1-A/vbmeta_a.bin
fastboot flash --disable-verity --disable-verification vbmeta_b        ~/r1-backups/r1-A/vbmeta_b.bin
# ...and the same for vbmeta_system_a/_b and vbmeta_vendor_a/_b
fastboot erase userdata
fastboot erase md_udc          # the real /metadata; stale keys here stop /data mounting
fastboot reboot fastboot

# fastbootd
fastboot getvar current-slot   # trust this value
fastboot snapshot-update cancel
fastboot delete-logical-partition product_<slot>   # optional: removes Rabbit's apps
fastboot -S 100M flash system_<slot> lineage-21.0-20261109-UNOFFICIAL-arm64_bvN.img
fastboot reboot
```

**Known risks for this step:**

- **"Failed to find AVB_MAGIC".** Some recent fastboot versions fail the `--disable-verity` edit. robotOS gets round it by setting bytes 120–123 of the vbmeta image to `00 00 00 03` itself.
- **A red "dm-verity corruption" screen and no fastbootd.** [r1_escape PR #97](https://github.com/RabbitHoleEscapeR1/r1_escape/pull/97) reports this on rabbitOS 2.3.1 after unlocking with r1_escape. Their fix rewrites `seccfg` with `dm_verity_state=0`. They also truncate `vbmeta_vendor_a` to 11534336 bytes. We have the stock `seccfg` backed up if we need to go this way.
- **The home screen crash-loops.** Lineage's launcher needs AppWidgetService, which some builds lack. That doesn't matter for us: our app becomes the home screen, and Croissant disables `com.android.launcher3`.

## 6. Afterwards

- Root with Magisk, then run `adb shell getevent -lt`, press everything, and write the scancodes down.
- **Device Owner needs a Magisk module.** The R1's vendor doesn't declare `android.software.device_admin`, so `dpm set-device-owner` is refused. Croissant ships a module that adds `/system/etc/permissions/android.software.device_admin.xml`.
- Never run `adb root`. frogmoses found it re-enumerates USB and killed touch.
- Touch dying after the screen turns off, and the side button not waking the R1 from deep sleep, are reported on CipherOS. Nobody has checked on Lineage yet.

## Getting back to stock

Write the backup back with `mtk wl ~/r1-backups/r1-A`, then replug. The official [firmware archive](https://github.com/rabbit-hmi-oss/firmware) is still up but stops at v0.8.293 (May 2025), so your own backup is the only copy of the 2.x firmware you have.
