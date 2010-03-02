# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Get local profile (not shared across machines)
if [ -f ~/.local_profile.bash ]; then
        . ~/.local_profile.bash
fi


# EDITOR variables
export EDITOR=`which vim`
export SVN_EDITOR=`which vim`
export GIT_EDITOR=`which vim`
if [[ -s /Users/lchin/.rvm/scripts/rvm ]] ; then source /Users/lchin/.rvm/scripts/rvm ; fi
