# Initialing bash on login.

# Setting variables.
[[ -f ~/.config/exportrc ]] && . ~/.config/exportrc

# Loading config.
[[ -f ~/.config/bash/bashrc ]] && . ~/.config/bash/bashrc

# Start X session on login.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
