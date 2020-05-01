# Initializes on every terminal open.

###############################################################
# Setting variables.
###############################################################
# Default programs:
export TERMINAL="konsole"
export EDITOR="vim"
export BROWSER="brave"
export FILE_MANAGER="ranger"
export READER="zathura"

# Adds `~/.local/bin` to $PATH.
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export LOAD_CONDA=0                         # Whether to load conda or not.
export RANGER_LOAD_DEFAULT_RC=FALSE         # Assigning ranger config.
export PROMPT_COMMAND="pwd > /tmp/whereami" # Saving current dir to file.

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PS1='\[\033[38;5;2m\]\u\[\033[38;5;15m\]@\[\033[\e[38;5;34m\]\h\[\033[38;5;15m\]:[\W]$(__git_ps1 " (%s)")\$ '

###############################################################
# Sourcing other configs.
###############################################################
# Initializing git prompt.
source ~/.git-prompt.sh

# Initializing conda.
[ "$LOAD_CONDA" -eq 1 ] && [[ -f ~/.bashrc_local ]] && . ~/.bashrc_local

###############################################################
# Aliases.
###############################################################
alias ls='ls --color=auto'
alias ll='ls -lah'
alias h='htop'
alias c='chromium --new-window'
alias ga='git add'
alias gc='git commit'
alias gp='git push -u origin master'
alias gs='git status'
alias gd='git diff'
alias tree='tree -Ca'
alias z='f() { zathura $1 & }; f'
alias i3lock='i3lock -i ~/Pictures/Wallpapers/arch2.jpg'
alias rpl='ssh furiousteabag@192.168.1.160'
alias rpg='ssh furiousteabag@10.5.117.27'
alias yv='youtube-viewer -C'
alias nmc='nmcli dev wifi'
alias ka='killall'
alias p='sudo pacman'
alias pmp='pandoc --pdf-engine=pdflatex -V lang=ru'
alias pmpb='pandoc --pdf-engine=pdflatex -V lang=ru -t beamer'
# alias p='prettier'
# alias pw='prettier --write'

###############################################################
# Terminal mode.
###############################################################
set -o vi  # Setting vi mode.
