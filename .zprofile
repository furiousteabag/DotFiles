# Initialing zsh on login.

# Setting variables.
[[ -f ~/.config/exportrc ]] && . ~/.config/exportrc

# Loading config.
[[ -f ~/.config/zsh/.zshrc ]] && . ~/.config/zsh/.zshrc

# Start X session on login or tmux session if on server.
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx || tmux attach || tmux new-session -s main 'nvim +qall; $SHELL'
