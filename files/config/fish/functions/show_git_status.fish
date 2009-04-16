# Displays a marker if current git working copy is dirty (unstaged changes exist)
function show_git_status
  if git status | tail -1 | grep 'git add'  2> /dev/null 1>/dev/null
    echo ' ! '
  end
end