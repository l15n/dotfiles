# Enable rbenv
status --is-interactive; and source (rbenv init -|psub)

# Install Starship
starship init fish | source

# jump: https://github.com/gsamokovarov/jump
if which -s jump
	status --is-interactive; and source (jump shell fish | psub)
end
