# Initialing bash on login.

# Setting variables.
[[ -f ~/.config/exportrc ]] && . ~/.config/exportrc

# Loading config.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X session on login.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx

# Keyboard instructions. 
setxkbmap -option caps:escape &                             # Caps -> Escape.
setxkbmap -layout us,ru -option 'grp:alt_space_toggle' &    # Layout changing shortcut.
