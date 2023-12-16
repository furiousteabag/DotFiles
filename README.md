# Setup

1. Execute setup script:
   ```bash
   sudo pacman -S git
   git clone https://github.com/SmirnovAlexander/DotFiles.git
   cd DotFiles
   ./setup.sh
   ```
2. Reboot in case of desktop and relogin in case of server
3. Execute post setup script if on desktop:
   ```bash
   ./post_setup.sh
   ```
4. Install vim plugins:
   ```
   :PlugInstall
   :Copilot auth
   ```
5. Install tmux plugins:
   ```
   <C-b> + I
   ```
6. Brave settings
   - [disable password savings](brave://settings/passwords)
   - [change search engine to Google](brave://settings/search)
     - [enable autocomplete searches option](brave://settings/privacy)
   - install extensions
     - [vimium extension](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)
     - [workspaces extension](https://chrome.google.com/webstore/detail/workspaces/hpljjefgmnkloakbfckghmlapghabgfa?hl=en)
     - [grammarly extension](https://chrome.google.com/webstore/detail/grammarly-grammar-checker/kbfnbcaeplbcioakkpcpgfkobkghlhen)
     - [copy unicode urls](https://chrome.google.com/webstore/detail/copy-unicode-urls/fnbbfiapefhkicjhecnoepbijhanpkjp/)

## TODO

- make sleep work well
  - work while sleeping and drains battery
- rm move to trash folder but not delete
- complete deletion [script](./config/nsxiv/exec/key-handler) of marked photos in nsxiv
- add update-pc script for symlinking new files from repo to host machine
- find font pack with icons
- open all terminal windows at tmux
  - `tmux attach-session -t random \; new-window ranger`
- solution for notes management
- rewrite mute script to iterate through all sources and mute/unmute them
  - display muted status as **every** output is muted
- add st plugins patches
  - [font2](https://st.suckless.org/patches/font2/)
    - `static char *font2[] = { "NotoColorEmoji:pixelsize=10:antialias=true:autohint=true" };`
  - [scrollback](https://st.suckless.org/patches/scrollback/)
  - [alpha](https://st.suckless.org/patches/alpha/)
  - [copyurl](https://st.suckless.org/patches/copyurl/)
  - [open_copied_url](https://st.suckless.org/patches/open_copied_url/)

## Known issues

- tmux is not loading config from `$XDG_CONFIG_HOME/tmux/tmux.conf` on old versions
- nsxiv images in thumbnail mode and .HEIC are rotated according to `EXIF:Orientation` tag but they shouldn't
  - maybe because of `imagemagick` package required by `betterlockscreen`
- for virtualbox to function properly, add `ibt=off` to kernel parameters
  - to add shared folder, install `virtualbox-guest-iso` (or `virtualbox-guest-utils`), run `Devices -> Insert Guest Additions CD Image` and `My Computer -> CD Drive (VirtualBox Guest Additions) -> VBoxWindowsAdditions.exe.`
  - add user to `vboxusers` group to detect USB devices
  - shared clipboard (requires guest additions): highlight the Guest VBox in the VirtualBox console, open General -> Advanced. Here you can choose between various Shared Clipboard settings: Disabled, Guest to Host, Host to Guest or Bidirectional
- to connect MTP devices (e.g. Garmin), use [libmtp](https://wiki.archlinux.org/title/Media_Transfer_Protocol#libmtp)
- to make printer work
  - https://wiki.archlinux.org/title/Avahi#Hostname_resolution
- suspend vs hibernate
  - suspend seems to drain a lot of battery, but it might be because of lid opens in backpack and laptop turns on
    - investigate the effect of disabling waking on lid open
  - hibernate
    - doesn't work by default
    - general instruction https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Hibernation
    - create swap for hibernation https://wiki.archlinux.org/title/swap#Swap_file_creation (maybe not needed)
    - add kernel parameters https://wiki.archlinux.org/title/Kernel_parameters#systemd-boot
    - https://bbs.archlinux.org/viewtopic.php?id=259382 in case "Not enough swap space for hibernation"
- to connect meshtastic
  - install driver https://aur.archlinux.org/packages/ch343ser-dkms-git (maybe would've worked w/o it) & reboot
  - `sudo pacman -S esptool`
  - `ll /dev | grep USB`
  - `esptool.py -p /dev/ttyCH343USB1 chip_id`
  - Download release https://github.com/meshtastic/firmware/releases
  - `./device-install.sh -p /dev/ttyCH343USB1 -f firmware-tbeam-2.1.19.eb7025f.bin`
  - `meshtastic --port /dev/ttyCH343USB1 --info`
  - `meshtastic --port /dev/ttyCH343USB1 --set lora.region 'RU'`
- to set up wifi hotspot (shares VPN as well)
  - https://wiki.archlinux.org/title/software_access_point#linux-wifi-hotspot
- to download/upload config to baofeng
  - install drivers: silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=downloads
    - https://xn--80abhh4be6b.xn--p1ai/ivstrukcii-i-soft/drajveri
  - install software: https://www.baofengradio.com/pages/download
  - reboot
- to fix screen tearing enable vsync with glx backend in picom
