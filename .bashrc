# Assigning ranger config.
export RANGER_LOAD_DEFAULT_RC=FALSE

export PROMPT_COMMAND="pwd > /tmp/whereami"

# Initializing git prompt
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUNTRACKEDFILES=1

# Initializing prompt.
PS1='\[\033[38;5;2m\]\u\[\033[38;5;15m\]@\[\033[\e[38;5;34m\]\h\[\033[38;5;15m\]:[\W]$(__git_ps1 " (%s)")\$ '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/furiousteabag/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/furiousteabag/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/furiousteabag/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/furiousteabag/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
#
#conda activate odom

# Setting up a default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Aliases
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
alias p='prettier'
alias pw='prettier --write'
alias z='f() { zathura $ 1 & }; f'
alias i3lock='i3lock -i ~/Pictures/Wallpapers/arch2.jpg'

# Setting terminal in vi mode
set -o vi
