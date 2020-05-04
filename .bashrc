# Initializes on every terminal open.

###############################################################
# Initializing prompt.
###############################################################
export PS1='\[\033[38;5;2m\]\u\[\033[38;5;15m\]@\[\033[\e[38;5;34m\]\h\[\033[38;5;15m\]:[\W]$(__git_ps1 " (%s)")\$ '

###############################################################
# Sourcing configs.
###############################################################
# Loading aliases.
[[ -f ~/.config/aliasrc ]] && . ~/.config/aliasrc

# Initializing git prompt.
[[ -f ~/.config/git-prompt.sh ]] && . ~/.config/git-prompt.sh

# Initializing conda.
[ "$LOAD_CONDA" -eq 1 ] && [[ -f ~/.config/conda-init ]] && . ~/.config/conda-init

###############################################################
# Terminal mode.
###############################################################
set -o vi
