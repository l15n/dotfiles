# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Get local profile (not shared across machines)
if [ -f ~/.local_profile ]; then
        . ~/.local_profile.bash
fi


# EDITOR variables
export EDITOR="/usr/bin/vim"
export SVN_EDITOR="/usr/bin/vim"
export GIT_EDITOR="/usr/bin/vim"
if [[ -s /Users/lchin/.rvm/scripts/rvm ]] ; then source /Users/lchin/.rvm/scripts/rvm ; fi
