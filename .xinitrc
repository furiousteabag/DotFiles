#!/bin/sh
#
# Initializes X session and starts some useful daemons.

########################################
## Daemons.
########################################
picom &                                                     # Composite manager for transparency.
unclutter &                                                 # Remove mouse cursor.
dunst &                                                     # Notification manager.
udiskie -a -n &                                             # Automount manager.
flameshot &                                                 # Screenshot tool.
# xautolock -corners 00+- -time 10 -locker "betterlockscreen -l" & # Screen lock.
# xautolock -time 7 -locker "systemctl suspend" &
#powertop --auto-tune &                                      # Power management.

########################################
## Presets.
########################################
# setkb                                           # Set keyboard layout.
setbg                                           # Setting background.

#######################################
# Starting session.
#######################################
exec i3
