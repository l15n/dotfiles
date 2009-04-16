# Determines revision number of current subversion working copy
function parse_svn_revision
  svn info | sed -n '/^Revision/p' | sed -e 's/^Revision: \(.*\)/\1/' 2> /dev/null
end