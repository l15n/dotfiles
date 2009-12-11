# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Get local profile (not shared across machines)
if [ -f ~/.local_profile ]; then
        . ~/.local_profile.bash
fi


# EDITOR variables
export EDITOR="mvim"
export SVN_EDITOR="mvim -f"
export GIT_EDITOR="mvim -f"
