# Add macports directories to front of path cleanly on login
set extra_paths /opt/local/sbin /opt/local/bin /usr/local/git/bin ~/bin
for pathelem in $extra_paths
  if test -d $pathelem
    set -x PATH $pathelem $PATH
  end
end

set nuggets $HOME/.config/nuggets
if not contains $nuggets/completions $fish_complete_path
  set -x fish_complete_path $fish_complete_path $nuggets/completions
end
if not contains $nuggets/functions $fish_function_path
  set -x fish_function_path $fish_function_path $nuggets/functions
end

set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set fish_greeting "Starting fish"
set -x EDITOR vim
if which most 1> /dev/null
  set -x MANPAGER most
else
  set -x MANPAGER less
end
set -x GIT_PAGER less