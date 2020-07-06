set -gx GIT_EDITOR 'nvim'
set -gx EDITOR 'nvim'

set -gx GOPATH '$HOME/go'

# Read local configuration if available
if test -e ~/.config/fish/localconfig.fish
  source ~/.config/fish/localconfig.fish
end

# Enable rbenv
set -gx PATH ~/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

# Enable pyenv
set -gx PATH ~/.pyenv/bin $PATH
status --is-interactive; and source (pyenv init - | psub)

# Install Starship
starship init fish | source

# jump: https://github.com/gsamokovarov/jump
if which -s jump
  status --is-interactive; and source (jump shell fish | psub)
end

# Nodebrew for managing node versions https://github.com/hokaccha/nodebrew
if test -x ~/.nodebrew/current/bin/nodebrew
  set -gx  PATH ~/.nodebrew/current/bin $PATH
end

abbr --add br bundle exec rspec
