function fish_prompt -d "Write out the prompt"
  set last_status $status
  if test $last_status != 0
    printf "%s(status: $last_status)%s " (set_color red) (set_color normal)
  end
  printf '%s%s@%s%s' (set_color brown) (whoami) (hostname|cut -d . -f 1) (set_color normal) 
 
  # Color writeable dirs green, read-only dirs red
  if test -w "."
    printf ' %s%s' (set_color $fish_color_cwd) (prompt_pwd)
  else
    printf ' %s%s' (set_color $fish_color_cwd_root) (prompt_pwd)
  end

  # Print subversion revision
  if test -d ".svn"
    printf ' %s%s@%s' (set_color normal) (set_color blue) (parse_svn_revision)
  end
 
  # Print git branch
	set gitdir (git rev-parse --git-dir 2>/dev/null)
  if test $gitdir
		printf ' %s%s/%s%s' (set_color normal) (set_color blue) (parse_git_branch) (show_git_status)
	end
	printf '%s> ' (set_color normal)
	# Workaround for screen title
	switch $TERM
	  case 'screen-bce'
      #fish_title
  end
end
