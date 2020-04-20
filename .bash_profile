# Initialing shell on login.

# Loading config.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X session on login.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
