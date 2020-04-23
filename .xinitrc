#!/bin/sh
#
# Initializes X session and starts some useful daemons.

#######################################
# Nvidia settings.
#######################################
xrandr --auto

#######################################
# Daemons.
#######################################
powertop --auto-tune &                                      # Power management.
setxkbmap -layout us,ru -option 'grp:alt_space_toggle' &    # Layout changing shortcut.
setxkbmap -option caps:escape &                             # Caps -> Escape.
unclutter &                                                 # Remove mouse cursor.
compton &                                                   # Composite manager for transparency.
dunst &                                                     # Notification manager.
udiskie -a -n &                                             # Automount manager.
setbg                                                       # Setting background.
xset r rate 300 50 &	                                    # Speed xrate up.

#######################################
# Starting session.
#######################################
exec i3
