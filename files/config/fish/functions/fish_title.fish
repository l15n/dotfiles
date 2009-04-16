# Use both default title, and screen title (used in tmux)
function fish_title
  switch $_
  case 'fish'
    set title (prompt_pwd)
  case 'sudo'
    set title $history[1]
  case '*'
    set title $_
  end
  switch $TERM
  case 'screen' # using tmux
    echo $_ ' '
    echo -n \007\033k$title\033\\\033]\;
  case 'screen-bce' # using GNU screen with bce
    screen -X title $title
  case '*'
    echo $title ' '
  end
end