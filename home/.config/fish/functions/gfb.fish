function gfb
  git switch (git recent | fzf | awk 'BEGIN {FS="\t"};{print $2}')
end
