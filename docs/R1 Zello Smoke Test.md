# R1 Zello Smoke Test

Nov 28, 2026 · @Chris Barlow

## Summary

Task 3 of the [Hack Day Action Plan](Hack%20Day%20Action%20Plan.md): install Zello, an existing push-to-talk app, on both flashed R1s and talk between them. It has two jobs:

1. **It is the guaranteed fallback.** If our own app isn't working on 4 December, Zello on the two R1s is the demo.
2. **It gives a baseline.** It shows how loud the R1s are, how long the delay is, and whether the F9 side button works with a real push-to-talk app, before we write our own audio code.

Both R1s were set up with the [R1 Flashing Runbook](R1%20Flashing%20Runbook.md): rooted LineageOS 21 with no Google apps, and the side button sending `F9`.

| Step | R1 "A" | R1 "B" |
|---|---|---|
| Wi-Fi | Connected | Connected (5 GHz, about -68 dBm, 45 ms ping to 1.1.1.1) |
| Zello installed | To do | 7.21.1 |
| Signed in | To do | Yes: free personal account |
| Side button set as Zello's talk button | To do | Yes: listed as "F9, Hold to talk" |
| Talk over Wi-Fi | To do | To do |
| Echo test (talk to Zello's echo contact) | To do | Plays back clearly. Quiet at 8/25 media volume, loud enough at 19/25. About 0.5 s from letting go to playback |
| Loudness and delay between R1s | To do | To do |
| Talk over 4G (needs a SIM) | To do | To do |

## Installing Zello

There's no Play Store on these builds, so the APK comes straight from Zello. Its [Android release notes](https://zello.com/release-notes/android/) page links a stable "latest" file:

```
curl -fL -o zello.apk https://zello.com/data/android/latest/zello.apk
adb -s <serial> install -r zello.apk
adb -s <serial> shell dumpsys package com.loudtalks | grep versionName
```

On 28 November that was version 7.21.1 (`versionCode 7002101`): 85,843,057 bytes, SHA-256 `8c73892b88cb21e2276d831b894d92fb1d46462b1a5f1cb966c9f919a6f1875a`. The package name is `com.loudtalks`. It needs Android 7.0 or later, and the R1 runs Android 14.

With both R1s plugged in, use `adb devices` to get their serials, and pass `-s <serial>` to each adb command.

There is no home screen app on these builds, so open Zello over adb:

```
adb -s <serial> shell monkey -p com.loudtalks -c android.intent.category.LAUNCHER 1
```

## Setting up an R1 (done on R1 "B")

Each R1 needs its own **free personal Zello account**. One email address makes one account, so use a different address, or an alias, for each R1. Keep the account details out of this repo.

1. **Sign up.** Zello's sign-up asks for an email first. On "What would you like to do on Zello?" pick **Engage with friends and community**, the free personal account. The other two choices are Zello Work, the paid version. Then enter a username and a password. Creating the account means agreeing to Zello's terms, so the owner should tap **Create account** themselves.
2. **Permissions.** Grant the ones a walkie-talkie needs ahead of time, so they don't prompt:
   ```
   for p in RECORD_AUDIO POST_NOTIFICATIONS BLUETOOTH_CONNECT; do adb -s <serial> shell pm grant com.loudtalks android.permission.$p; done
   ```
   Decline contacts and phone calls; the R1 has neither. On the phone-calls prompt, the "Don't allow" button is below the bottom of the R1's 480×640 screen, so press Back instead, which also declines. **Allow "always run in background"**, so Zello can receive messages with the screen off. A short "what will you use Zello for" survey follows: answer Other.
3. **The side button.** Zello's profile menu → **Settings → Push-to-talk buttons → +**. At "Press the button now", press the side button once. It appears as **F9, Hold to talk**. Our [Magisk module](R1%20Flashing%20Runbook.md#side-button-to-f9-push-to-talk) makes the side button send `F9`, so Zello sees an ordinary key.
4. **Volume.** Zello plays through the **media** stream (`USAGE_MEDIA`), not the voice-call stream. At Android's default of 8/25 it was quiet. `cmd media_session volume --set` and `cmd audio set-volume` were both ignored. But volume-key events from adb work while Zello is in front, because Android then applies them to media volume:
   ```
   for i in $(seq 1 11); do adb -s <serial> shell input keyevent KEYCODE_VOLUME_UP; done   # 8 -> 19 of 25
   ```
5. **Echo test.** Open the built-in **echo** contact, hold the side button, talk, and let go. echo plays the message back. Don't tap the red **EMERGENCY** button on the talk screen; it's a locked paid feature.

The whole setup can be driven over adb: `adb exec-out screencap -p` to see the screen, `uiautomator dump` to find button positions, and `input tap`, `input text` and `input keyevent` to act. Only the account details and the Create account tap were left to the owner.

## Results

| Test | R1 "B" | Notes |
|---|---|---|
| Side button as talk button | Works | Zello's key list shows `F9`. The Magisk remap does its job in a real push-to-talk app |
| Microphone | Works | Android logged Zello recording for about 3.4 s on a 3-second message |
| Loudness | Quiet at 8/25 media volume; loud enough and clear at 19/25 | Judged by ear, not measured |
| Echo round trip | About 0.5 s from release to playback | This is echo's turnaround, not mouth-to-ear delay between two R1s. That still needs measuring |
