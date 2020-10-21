#!/bin/sh
#
# Initializes X session and starts some useful daemons.

########################################
## Daemons.
########################################
picom &                                                     # Composite manager for transparency.
unclutter &                                                 # Remove mouse cursor.
setbg                                                       # Setting background.
#powertop --auto-tune &                                      # Power management.
#dunst &                                                     # Notification manager.
#udiskie -a -n &                                             # Automount manager.
xset r rate 300 50  	                                    # Speed xrate up.

########################################
## Remaps.
########################################
setxkbmap -option caps:escape, -layout us,ru -option 'grp:alt_space_toggle'

#######################################
# Starting session.
#######################################
exec i3
