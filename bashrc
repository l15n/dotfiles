# ~/.bashrc is executed when non-login interactive shells are started

# Convenience aliases
alias g="git"
alias i="irb"
alias r="rails"
alias a="ack"
alias b="bundle"
alias be="bundle exec"
alias v="vim"
alias git="hub"
alias chrome='open -a "Google Chrome"'
alias vim=nvim

alias gpr="git pull-request"
alias gpf="git push --f"
alias gpm="git push -u mine HEAD"

alias pv='vim `find . | peco`'
alias pcd='cd $(ghq list -p |peco)'
alias pco='git checkout `git branch | peco`'
alias phq='cd $(ghq list -p | peco)'

# Shortcut for using fzf and ghq together
alias fghq='cd $(ghq root)/$(ghq list | fzf --reverse --height 20)'

# Aliases using OS dependent flags
if [ $OSTYPE = 'linux-gnu' ]; then
	alias ls="ls --color=always"
	alias l="ls -lhia"
else
	# Assume Darwin/BSD if not linux-gnu
	alias ls="ls -G"
	alias l="ls -lhGa"
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

if [ -f ~/.bash.d/hub.git-completion.bash ]; then
	source ~/.bash.d/hub.git-completion.bash
fi

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# https://github.com/rupa/z
if [ -f `brew --prefix`/etc/profile.d/z.sh ]; then
	. `brew --prefix`/etc/profile.d/z.sh
fi

# Use Starship for fancy prompt
# https://github.com/starship/starship
if which -s starship; then
	eval "$(starship init bash)"
else
	# Use as fallback only while trialling starship for prompt
	source ~/.bash.d/prompt.bash
	ps1_set
fi

