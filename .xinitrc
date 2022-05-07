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
#powertop --auto-tune &                                      # Power management.

########################################
## Presets.
########################################
setxkbmap -option caps:escape                               # caps -> esc
setxkbmap -option altwin:swap_alt_win                       # change alt w/ win
# setxkbmap -layout us,ru -option 'grp:alt_space_toggle'      # toggle layout.
setxkbmap -layout us,ru -option 'grp:win_space_toggle'      # toggle layout.
setbg                                                       # Setting background.
xset r rate 300 50  	                                    # Speed xrate up.

#######################################
# Starting session.
#######################################
exec i3
