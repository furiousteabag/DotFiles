#!/bin/sh
#
# Initializes X session and starts some useful daemons.

prefix="/usr"
exec_prefix="${prefix}"
xrdb="xrdb"
xinitdir="/etc/X11/xinit"
xmodmap="xmodmap"

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="$xinitdir/.Xresources"
sysmodmap="$xinitdir/.Xmodmap"

# merge in defaults and keymaps

if [ -f "$sysresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$sysresources"
    else
        "$xrdb" -nocpp -merge "$sysresources"
    fi
fi

if [ -f "$sysmodmap" ]; then
    "$xmodmap" "$sysmodmap"
fi

if [ -f "$userresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$userresources"
    else
        "$xrdb" -nocpp -merge "$userresources"
    fi
fi

if [ -f "$usermodmap" ]; then
    "$xmodmap" "$usermodmap"
fi

if [ -d "$xinitdir"/xinitrc.d ] ; then
	for f in "$xinitdir/xinitrc.d"/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

########################################
## Daemons.
########################################
picom &                # Composite manager for transparency.
unclutter &            # Remove mouse cursor.
dunst &                # Notification manager.
udiskie -a -n &        # Automount manager.
flameshot &            # Screenshot tool.
nm-applet --no-agent & # Network manager icon w/o notification on connections.
# nm-applet & # Network manager icon w/o notification on connections.
lxqt-policykit-agent & # Authorize as root via GUI.
libinput-gestures-setup start & # Start gestures service.
xbindkeys &            # Keybinds from .xbindkeysrc
# aw-qt &                # Activity watch tool.
xscreensaver --no-splash &

########################################
## Presets.
########################################
# setbg # Setting background.
xwallpaper --daemon --zoom ~/.config/wall.png # Redraw wallpaper on screen change.

#######################################
# Starting session.
#######################################
# xrandr --output eDP-1-1 --auto

exec i3
