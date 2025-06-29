# DotFiles

These are config files and scripts which power my arch linux system.

## Installation

1. Execute setup script:
   ```bash
   sudo pacman -S git
   git clone https://github.com/SmirnovAlexander/DotFiles.git && cd DotFiles
   ./setup.sh
   ```
2. Reboot in case of desktop and relogin in case of server
3. (Optionally) Install `conda`, initialize ssh and gpg keys:
   ```bash
   ./post_setup.sh
   ```
4. Install neovim plugins:
   ```
   :PlugInstall
   :Copilot auth
   ```
5. Install tmux plugins:
   ```
   <C-b> + I
   ```
6. Configure Brave browser:
   - enable brave sync: `brave://settings/braveSync/setup` or:
     - disable password savings: `brave://settings/passwords`
     - change search engine to Google: `brave://settings/search`
     - enable autocomplete searches option: `brave://settings/privacy`
     - install extensions:
       - [Vimium](https://chromewebstore.google.com/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)
       - [Unhook](https://chromewebstore.google.com/detail/unhook-remove-youtube-rec/khncfooichmfjbepaaaebmommgaepoid)
       - [Grammarly](https://chromewebstore.google.com/detail/grammarly-ai-writing-and/kbfnbcaeplbcioakkpcpgfkobkghlhen)
       - [Copy Unicode URLs](https://chromewebstore.google.com/detail/copy-unicode-urls/fnbbfiapefhkicjhecnoepbijhanpkjp)
       - [ActivityWatch](https://chromewebstore.google.com/detail/activitywatch-web-watcher/nglaklhklhcoonedhgnpgddginnjdadi)
       - [Ctrl Zoom](https://chromewebstore.google.com/detail/ctrl-zoom/indpmklmjbcfkbnbhoknlggplddednhp)

## Additional Configuration Info

- `.xinitrc` should be copied from default and edited [Arch Wiki | Xinit / xinitrc](https://wiki.archlinux.org/title/Xinit#xinitrc)
- for the iGPU/GPU laptop, follow info from my thread [Arch Forum | Xorg: Cannot run in framebuffer mode](https://bbs.archlinux.org/viewtopic.php?pid=2248491)
- to enable pacman parallel download follow [Arch Wiki | pacman / Enabling parallel downloads](https://wiki.archlinux.org/title/pacman#Enabling_parallel_downloads)
- to speed up pacman packages download, update mirrorlist by something like `sudo reflector --sort rate --connection-timeout 2 --download-timeout 2 --threads 10 --save /etc/pacman.d/mirrorlist`
- if you can't log in after a couple of failed attempts it is probably caused by `faillock` [Arch Wiki | security / Lock out user after three failed login attempts](https://wiki.archlinux.org/title/security#Lock_out_user_after_three_failed_login_attempts)
- to change `sudo` timeout follow [Arch Wiki | sudo / Tips and tricks / Reduce the number of times you have to type a password](https://wiki.archlinux.org/title/sudo#Reduce_the_number_of_times_you_have_to_type_a_password)
- `ranger` is not previewing anything when user is `root`. This is on purpose and should be toggled with `zp` (enable syntax highlighting with `zv`) [GitHub | ranger / issues](https://github.com/ranger/ranger/issues/1369#issuecomment-450562777)
- `tmux` is not loading config from `$XDG_CONFIG_HOME/tmux/tmux.conf` on old versions
- `nsxiv` images in thumbnail mode and `.HEIC` are rotated according to `EXIF:Orientation` tag but they shouldn't
  - maybe because of `imagemagick` package required by `betterlockscreen`
- for `virtualbox` to function properly, add `ibt=off` to kernel parameters
  - to add shared folder, install `virtualbox-guest-iso` (or `virtualbox-guest-utils`), run `Devices -> Insert Guest Additions CD Image` and `My Computer -> CD Drive (VirtualBox Guest Additions) -> VBoxWindowsAdditions.exe.`
  - add user to `vboxusers` group to detect USB devices
  - shared clipboard (requires guest additions): highlight the Guest VBox in the VirtualBox console, open General -> Advanced. Here you can choose between various Shared Clipboard settings: Disabled, Guest to Host, Host to Guest or Bidirectional
- to connect MTP devices (e.g. Garmin), use [libmtp](https://wiki.archlinux.org/title/Media_Transfer_Protocol#libmtp)
- to make printer work use [Avahi](https://wiki.archlinux.org/title/Avahi)
- suspend vs hibernate:
  - suspend:
    - seems to drain a lot of battery, but it might be because of lid opens in backpack and laptop turns on
    - investigate the effect of disabling waking on lid open
  - hibernate:
    - doesn't work by default
    - general configuration instruction: [Arch Wiki | Power management / Suspend and hibernate](https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Hibernation)
    - create swap for hibernation (maybe not needed): [Arch Wiki | Swap / Swap file creation](https://wiki.archlinux.org/title/swap#Swap_file_creation)
    - add kernel parameters: [Arch Wiki | Kernel parameters / systemd-boot](https://wiki.archlinux.org/title/Kernel_parameters#systemd-boot)
    - in case "Not enough swap space for hibernation": [[SOLVED] Fail to hibernate "Not enough swap space for hibernation"](https://bbs.archlinux.org/viewtopic.php?id=259382)
- to connect meshtastic:
  - install [driver from aur](https://aur.archlinux.org/packages/ch343ser-dkms-git) (maybe would've worked w/o it) and reboot
  - `sudo pacman -S esptool`
  - `ll /dev | grep USB`
  - `esptool.py -p /dev/ttyCH343USB1 chip_id`
  - Download [release from github](https://github.com/meshtastic/firmware/releases)
  - `./device-install.sh -p /dev/ttyCH343USB1 -f firmware-tbeam-2.1.19.eb7025f.bin`
  - `meshtastic --port /dev/ttyCH343USB1 --info`
  - `meshtastic --port /dev/ttyCH343USB1 --set lora.region 'RU'`
- to set up wifi hotspot (shares VPN as well): [Arch Wiki | Software access point | linux-wifi-hotspot](https://wiki.archlinux.org/title/software_access_point#linux-wifi-hotspot)
- to download/upload config to baofeng walkie-talkie:
  - install [drivers](https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers?tab=downloads?tab=downloads) (another [source](https://xn--80abhh4be6b.xn--p1ai/ivstrukcii-i-soft/drajveri))
  - install [software from baofeng website](https://www.baofengradio.com/pages/download)
  - reboot
- to fix screen tearing enable vsync with glx backend in picom (already enabled in [picom.conf](./.config/picom/picom.conf))
- to fix [openvpn-install](https://github.com/angristan/openvpn-install) script on arch linux server apply [openvpn-install.diff](./.local/share/diffs/openvpn-install.diff)
- to use this setup on ROS embedded device, apart from sourcing ROS setup files, configure ip addresses like this in shell profile:
  ```bash
  export ROS_HOSTNAME=$(ip route | grep wlan0 | grep src | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | tail -1)
  export ROS_MASTER_URI=http://$ROS_HOSTNAME:11311
  ```
- to enable zoom in `st` (to make it work in neovim -- disable mouse `:set mouse=`):
  ```
  { ControlMask,          Button4, zoom,           {.f = +1} },
  { ControlMask,          Button5, zoom,           {.f = -1} },
  ```
  put them before `XK_ANY_MOD` masks
- to copy output, add:
  ```
  static char *copyoutput[] = { "/bin/sh", "-c", "st-copyout", "externalpipe", NULL };
  { MODKEY,               XK_o,           externalpipe,   {.v = copyoutput } },
  ```
- if laptop immediately wakes up after `suspend` or `hibernate` -> maybe I am touching touchpad?
- to use local X11 display from remote server via ssh, use:
  - add `-listen tcp` to X11 startup args `/etc/X11/xinit/xserverrc`
  - `xhost +`
  - export DISPLAY=IP:0.0
- gparted might not format partition because of udiskie automount; disable it
- to enable play/pause via Bluetooth headset, use `systemctl --user enable --now mpris-proxy` (https://wiki.archlinux.org/title/MPRIS#Bluetooth)
- to stream game window with OBS even if window is not in focus:
  - install gamescope for separate X session (https://wiki.archlinux.org/title/Gamescope)
    - if doesn't work, use https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=gamescope-git, specifying pkgver (remove pkgver function later in the file)
  - install https://github.com/nowrep/obs-vkcapture
  - run lutris game with gamescope `OBS_VKCAPTURE=1 gamescope -W 1920 -H 1080 -- gamemoderun obs-gamecapture lutris lutris:rungame/battlenet`
  - in OBS choose Game Capture as a source

## ToDo

- make `rm` command to move to trash folder but not delete
- open all terminal windows at tmux
  - `tmux attach-session -t random \; new-window ranger`
- come up with solution for notes management
- rewrite mute script to iterate through all sources and mute/unmute them
  - display muted status as **every** output is muted
- complete deletion [script](./config/nsxiv/exec/key-handler) of marked photos in nsxiv
- preinstall coc extensions in a setup script, which is useful for docker environments; begin [here](https://github.com/neoclide/coc.nvim/issues/2237) and [here](https://github.com/neoclide/coc.nvim/issues/118)
