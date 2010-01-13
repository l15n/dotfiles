# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Get local profile (not shared across machines)
if [ -f ~/.local_profile.bash ]; then
        . ~/.local_profile.bash
fi


# EDITOR variables
export EDITOR="/usr/bin/vim"
export SVN_EDITOR="/usr/bin/vim"
export GIT_EDITOR="/usr/bin/vim"
