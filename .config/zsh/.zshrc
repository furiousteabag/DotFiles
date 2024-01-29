# Initializes on every terminal open.

###############################################################
# Global settings.
###############################################################
# History.
HISTFILE="$HOME/.local/share/zsh/.histfile"
HISTSIZE=50000
SAVEHIST=50000
# DISABLE_MAGIC_FUNCTIONS=true

# Immediately append to history file:
setopt INC_APPEND_HISTORY
# Record timestamp in history:
setopt EXTENDED_HISTORY
# Expire duplicate entries first when trimming history:
setopt HIST_EXPIRE_DUPS_FIRST
# Dont record an entry that was just recorded again:
setopt HIST_IGNORE_DUPS
# Delete old recorded entry if new entry is a duplicate:
setopt HIST_IGNORE_ALL_DUPS
# Do not display a line previously found:
setopt HIST_FIND_NO_DUPS
# Dont record an entry starting with a space:
setopt HIST_IGNORE_SPACE
# Dont write duplicate entries in the history file:
setopt HIST_SAVE_NO_DUPS
# Share history between all sessions:
setopt SHARE_HISTORY

# Execute commands using history (e.g.: using !$) immediatel:
unsetopt HIST_VERIFY

bindkey -v                                       # Enable vi mode.
autoload -U colors && colors                     # Prompt colors.
bindkey '^r' history-incremental-search-backward # Search in history.

# Edit command in $EDITOR.
autoload -U edit-command-line      
zle -N edit-command-line
bindkey '^e' edit-command-line

PROMPT_EOL_MARK='' # Hide % at the end of output.

# Basic auto/tab complete:
fpath+=$HOME/.local/share/zfunc
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

eval $(ssh-agent) >/dev/null # Start ssh-agent (if not already running)
ssh-add -k 2>/dev/null # Add ssh keys.

###############################################################
# Sourcing configs.
###############################################################
# Loading aliases.
[[ -f ~/.config/aliasrc ]] && . ~/.config/aliasrc

# Initializing git prompt.
[[ -f ~/.config/git/git-prompt.sh ]] && . ~/.config/git/git-prompt.sh

###############################################################
# Initializing prompt.
###############################################################
setopt PROMPT_SUBST   # Evaluate prompt variables.
PS1='%B%{$fg[green]%}%n%{$reset_color%}%B@%{$fg[blue]%}%m%{$reset_color%}%B:%{$fg[yellow]%}%B[%c]%{$reset_color%}%B$(__git_ps1 " (%s)")%b$ '

###############################################################
# Cursor shape.
###############################################################
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init

echo -ne '\e[6 q'                # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

###############################################################
# Functions.
###############################################################

venv() {
  source $XDG_DATA_HOME/conda
  if [ ! -z "$1" ]; then
    conda activate $1
  else
    CURRENT_FOLDER=$(echo $PWD | awk -F '/' '{print $NF}')
    conda env list | cut -d' ' -f 1 | grep -q $CURRENT_FOLDER
    if [ $? -eq 0 ]; then
      conda activate $CURRENT_FOLDER
    fi
  fi
}

###############################################################
# Plugins.
###############################################################
source ~/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # Syntax highlight.
source ~/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh         # Autosuggestions.
source ~/.local/share/zsh/plugins/zsh-fzf-history-search/zsh-fzf-history-search.zsh   # History search
source ~/.local/share/zsh/plugins/zsh-docker-completion/_docker
