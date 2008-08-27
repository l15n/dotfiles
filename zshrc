## HISTORY
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
setopt extended_history
setopt hist_verify

## COMPLETION
autoload -U compinit
compinit # Smart completion
# Selectable auto-complete
zstyle ':completion:*:default' menu select=1 # cursor selection
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # add colors
setopt correct # spellcheck commands
setopt list_types
setopt auto_list
setopt auto_param_keys
setopt auto_param_slash

## EXTENSION AND GLOBBING
setopt extended_glob
setopt magic_equal_subst
setopt numeric_glob_sort

## CHANGING DIRECTORIES
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_cd

## JOB CONTROL
setopt long_list_jobs
setopt auto_resume

## ALIASES
alias ls="ls -h --color=auto"
alias ll="ls -lh --color=auto"
alias vi=vim

# For Screen: set title to command name
#preexec () {
#  echo -ne "\ek${1%% *}\e\\"
#}
# Return screen prompt to say zsh afterwards
#precmd () {
#  echo -ne "\ekzsh\e\\"
#}

# Emacs keybindings for the shell (explicit since EDITOR=vim)
bindkey -e

# Simple prompt
PS1="[%n@%m](%h)$ "
RPS1="%~"

