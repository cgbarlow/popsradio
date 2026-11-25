#!/usr/bin/env python3
"""Send the R1's preloader the FASTBOOT boot command, as r1_escape's mtkbootcmd.py does.

Needs the cdc_acm driver loaded (the preloader shows up as /dev/ttyACM*).
Start this, then plug in the switched-off R1.
"""
import sys
import time

from serial import Serial
from serial.tools import list_ports

CMD = (sys.argv[1] if len(sys.argv) > 1 else "FASTBOOT").encode()


def find_port():
    for p in list_ports.comports():
        if p.vid == 0x0E8D and p.pid == 0x2000:
            return p.device
    return None


# An R1 left plugged in sits on a stale preloader port that never says READY.
# Wait for it to go away, so we catch a fresh connection.
if find_port():
    print("The R1 is already connected. UNPLUG it now...")
    while find_port():
        time.sleep(0.05)
    print("Unplugged. Make sure it's fully off (hold the side button ~10 s if unsure).")
print("Now plug the R1 in (no buttons)...")
port = None
while port is None:
    port = find_port()
    time.sleep(0.01)
print(f"Found {port}, waiting for READY...")
s = None
deadline = time.time() + 5
while s is None:  # the tty node can appear a moment before it can be opened
    try:
        s = Serial(port, 115200, timeout=5)
    except Exception:
        if time.time() > deadline:
            raise
        time.sleep(0.01)
with s:
    buf = b""
    deadline = time.time() + 10
    while b"READY" not in buf and time.time() < deadline:
        buf += s.read(1)
    if b"READY" not in buf:
        sys.exit(f"No READY from the preloader (got {buf!r}). Unplug, power off and try again.")
    s.write(CMD)
    s.flush()
    print(f"Sent {CMD.decode()}. Response: {s.read(5)!r}")
print("Done. The R1 should now come up in fastboot; check with: fastboot devices")
