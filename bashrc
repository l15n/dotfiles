# ~/.bashrc is executed when non-login interactive shells are started

# Convenience aliases
alias g="git"
alias s="svn"
alias i="irb"
alias r="rails"
alias a="ack"
alias b="bundle"
alias v="vim"
alias svnksdiff="svn diff --diff-cmd=ksdiff-svnwrapper"
alias git="hub"

# Aliases using OS dependent flags
if [ $OSTYPE = 'linux-gnu' ]; then
	alias ls="ls --color=always"
	alias l="ls -lhia"
else
	# Assume Darwin/BSD if not linux-gnu
	alias ls="ls -G"
	alias l="ls -lhGa"
	# Don't use bundled vim on OS X
	alias vim="/usr/local/bin/vim"
fi

# Shell options
shopt -s checkwinsize
shopt -s cdspell

# Get local (not shared across machines) settings
# Primarily for local aliases
if [ -f ~/.localrc.bash ]; then
        source ~/.localrc.bash
fi

if [ -f ~/.bash.d/git-completion.bash ]; then
        source ~/.bash.d/git-completion.bash
fi

source ~/.bash.d/prompt.bash

# Load RVM just before the prompt
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

ps1_set
