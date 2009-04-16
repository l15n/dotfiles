# tmux has same problem as Leopard's GNU Screen: Distributed Objects doesn't work while in tmux
# The below is a work around for Textmate's mate command

# TODO: this still doesn't work for git
function mate
  if test $argv
    if test $argv[1] = -w
      set -e argv[1]
      open -a TextMate.app -W $argv
    else
      open -a TextMate.app $argv
    end
  else
    open -a TextMate.app $argv
  end
end