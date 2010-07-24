# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Get local profile (not shared across machines)
if [ -f ~/.local_profile.bash ]; then
        . ~/.local_profile.bash
fi

# Use bash-completion if available
if [ -f /usr/local/etc/bash_completion ]; then
	. /usr/local/etc/bash_completion
fi



# EDITOR variables
export EDITOR=`which vim`
export SVN_EDITOR=`which vim`
export GIT_EDITOR=`which vim`
export PATH=$PATH:$HOME/bin
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
