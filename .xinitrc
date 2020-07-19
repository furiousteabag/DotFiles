#!/bin/sh
#
# Initializes X session and starts some useful daemons.

#######################################
# Daemons.
#######################################
xrandr --auto                                               # Nvidia settings.
powertop --auto-tune &                                      # Power management.
unclutter &                                                 # Remove mouse cursor.
compton &                                                   # Composite manager for transparency.
dunst &                                                     # Notification manager.
udiskie -a -n &                                             # Automount manager.
setbg                                                       # Setting background.
xset r rate 300 50 &	                                    # Speed xrate up.
xbindkeys                                                   # Autoclicks minecraft bindings.

#######################################
# Starting session.
#######################################
exec i3
