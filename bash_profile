# Global settings
export EDITOR=nvim
export SVN_EDITOR=nvim
export GIT_EDITOR=nvim
export PATH=$PATH:$HOME/bin
export TERM=xterm-256color
export LANG=en_US.UTF-8
export GOPATH=$HOME/go
# See https://github.com/amatsuda/gem-src
export GEMSRC_USE_GHQ=1

# Disable the warning for Mac OS X Catalina
export BASH_SILENCE_DEPRECATION_WARNING=1

export HISTFILESIZE=5000

# Get local profile (not shared across machines)
if [ -f "$HOME/.local_profile.bash" ]; then
        source "$HOME/.local_profile.bash"
fi

# Use bash-completion if available
if [ -f "/usr/local/etc/bash_completion" ]; then
	source "/usr/local/etc/bash_completion"
fi

# Get the aliases and functions after login setup
if [ -f "$HOME/.bashrc" ]; then
        source "$HOME/.bashrc"
fi

if [[ -s $HOME/.rbenv/shims/ruby ]] ; then
	# Add rbenv to PATH
	export PATH=$HOME/.rbenv/bin:$PATH

	# Enable rbenv
	eval "$(rbenv init -)"
fi

if [[ -s $HOME/.pyenv/shims/python ]] ; then
	# Add pyenv to PATH
	export PATH=$HOME/.pyenv/bin:$PATH

	# Enable pyenv
	eval "$(pyenv init -)"
fi

