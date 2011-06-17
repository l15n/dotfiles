# Get local profile (not shared across machines)
if [ -f "$HOME/.local_profile.bash" ]; then
        source "$HOME/.local_profile.bash"
fi

# Use bash-completion if available
if [ -f "/usr/local/etc/bash_completion" ]; then
	source "/usr/local/etc/bash_completion"
fi

# EDITOR variables
if [ $OSTYPE = 'linux-gnu' ]; then
	export EDITOR=vim
	export SVN_EDITOR=vim
	export GIT_EDITOR=vim
else
	# Assume Darwin/BSD if not linux-gnu
	# On OS X, use own version of vim instead of OS X bundled vim
	export EDITOR="/usr/local/bin/vim"
	export SVN_EDITOR="/usr/local/bin/vim"
	export GIT_EDITOR="/usr/local/bin/vim"
fi
export PATH=$PATH:$HOME/bin
export TERM=xterm-256color
export LANG=en_US.UTF-8

# Get the aliases and functions after login setup
if [ -f "$HOME/.bashrc" ]; then
        source "$HOME/.bashrc"
fi

