# Get local profile (not shared across machines)
if [ -f "$HOME/.local_profile.bash" ]; then
        source "$HOME/.local_profile.bash"
fi

# Use bash-completion if available
if [ -f "/usr/local/etc/bash_completion" ]; then
	source "/usr/local/etc/bash_completion"
fi

export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim
export PATH=$PATH:$HOME/bin
export TERM=xterm-256color
export LANG=en_US.UTF-8

# Get the aliases and functions after login setup
if [ -f "$HOME/.bashrc" ]; then
        source "$HOME/.bashrc"
fi

# Add rbenv to PATH
export PATH=$HOME/.rbenv/bin:$PATH

# Enable rbenv
eval "$(rbenv init -)"
