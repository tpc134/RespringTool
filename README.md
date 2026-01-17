A lightweight utility app for jailbroken iOS devices (iOS 6–14) 
providing quick access to Respring and Safe Mode triggering

This project is designed to be simple, transparent, and historically accurate
to how MobileSubstrate behaves on older iOS versions.

Features

- Respring SpringBoard
- Trigger Safe Mode (jailbroken devices only)
- Minimal UI with two buttons
- No hooks, no background daemons, no system modifications

Supported iOS Versions

- iOS6.x – 14.x
- Jailbreak required
- Tested primarily on older devices (iOS6 / 7 behavior may vary)

How Safe Mode Works (Important)

This app triggers Safe Mode by sending an **ABRT signal** to SpringBoard:
killall -ABRT SpringBoard

Please note:
On iOS6, Safe Mode is not persistent

Safe Mode may:
Trigger only after a subsequent respring
Automatically return to normal mode after a short time
This is a MobileSubstrate limitation, not a bug in this app

What This App Does NOT Do

No system file modifications
No preference files
No MobileSubstrate hooks
No persistence or forced Safe Mode

This tool simply exposes existing system behavior in a user-friendly way

Build Environment
macosx 10.11.6
Xcode 7.3.1
iOS 9.2 SDK
Objective-C
