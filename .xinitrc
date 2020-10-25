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
#powertop --auto-tune &                                      # Power management.

########################################
## Presets.
########################################
setxkbmap -option caps:escape, \
    -layout us,ru -option 'grp:alt_space_toggle'            # caps -> esc; toggle layout.
setbg                                                       # Setting background.
xset r rate 300 50  	                                    # Speed xrate up.

#######################################
# Starting session.
#######################################
exec i3
