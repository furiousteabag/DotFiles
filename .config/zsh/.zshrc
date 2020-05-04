# Initializes on every terminal open.

###############################################################
# Global settings.
###############################################################
# History.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v
zstyle :compinstall filename '/home/furiousteabag/.zshrc'
autoload -Uz compinit
compinit
autoload -U colors && colors

###############################################################
# Sourcing configs.
###############################################################
# Setting variables.
[[ -f ~/.config/exportrc ]] && . ~/.config/exportrc

# Loading aliases.
[[ -f ~/.config/aliasrc ]] && . ~/.config/aliasrc

# Initializing git prompt.
[[ -f ~/.config/git/git-prompt.sh ]] && . ~/.config/git/git-prompt.sh

# Initializing conda.
[ "$LOAD_CONDA" -eq 1 ] && [[ -f ~/.config/conda-init ]] && . ~/.config/conda-init

###############################################################
# Initializing prompt.
###############################################################
setopt PROMPT_SUBST 
PS1='%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}:%{$fg[yellow]%}[%c]%{$reset_color%}$(__git_ps1 " (%s)")$ '

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
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.
