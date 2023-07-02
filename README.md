# Description

A short shell script to switch between Logi devices connected via bluetooth.

# How to use:
On the device assigned to the first channel do:
1. Install [hidapitester](https://github.com/todbot/hidapitester) using [Homebrew](https://brew.sh/) by executing `brew install mplew-is/wrappers/hidapitester`.
2. Copy `logi.sh` to `/usr/local/bin/logi`.
3. Execute `chmod +x /usr/local/bin/logi`.
4. Open **Shortcuts** app.
5. Create a new shortcut named **Switch to channel 2**.
6. Add a **Run Shell Script** with following code `logi -a2`.

Repeat the actions on the computer assigned to the second channel, but in last two steps replace **2** with **1**.

# Tips
Add these shortcuts to the dock OR use LogiTech Options+ app to open these Shortcuts when a mouse key pressed. For example "Gesture" key.
