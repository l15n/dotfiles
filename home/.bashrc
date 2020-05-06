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
alias vim=nvim

# Shortcut for using fzf and ghq together
alias fcd='cd $(ghq root)/$(ghq list | fzf --reverse --height 20)'
alias fco='git checkout $(git branch | fzf)'
alias fvim='nvim $(fzf)'

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

if which -s jump; then
	eval "$(jump shell bash)"
fi
