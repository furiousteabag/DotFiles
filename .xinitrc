#!/bin/sh
#
# Initializes X session and starts some useful daemons.

########################################
## Daemons.
########################################
picom &                # Composite manager for transparency.
unclutter &            # Remove mouse cursor.
dunst &                # Notification manager.
udiskie -a -n &        # Automount manager.
flameshot &            # Screenshot tool.
nm-applet --no-agent & # Network manager icon w/o notification on connections.

########################################
## Presets.
########################################
setbg # Setting background.

########################################
## Fixing file picker dialogs
########################################
# https://bbs.archlinux.org/viewtopic.php?id=292046
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#######################################
# Starting session.
#######################################
exec i3
