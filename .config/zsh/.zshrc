# Initializes on every terminal open.

###############################################################
# Global settings.
###############################################################
# History.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v                         # Enable vi mode.
autoload -U colors && colors       # Prompt colors.


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

###############################################################
# Sourcing configs.
###############################################################
# Loading aliases.
[[ -f ~/.config/aliasrc ]] && . ~/.config/aliasrc

# Initializing git prompt.
[[ -f ~/.config/git/git-prompt.sh ]] && . ~/.config/git/git-prompt.sh

# Initializing conda.
[ "$LOAD_CONDA" -eq 1 ] && [[ -f ~/.config/conda-init ]] && . ~/.config/conda-init

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
# Plugins.
###############################################################
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # Syntax highlight.
