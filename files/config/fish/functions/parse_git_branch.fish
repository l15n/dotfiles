# Extracts the branch name for current git working copy
function parse_git_branch
	git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' 2> /dev/null
end