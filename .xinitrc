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

#######################################
# Starting session.
#######################################
exec i3
