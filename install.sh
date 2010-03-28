#!/bin/bash
CURRENT_FILE="$PWD/$0"
BASEDIR=`dirname $CURRENT_FILE`
FILES="$BASEDIR/*"
for f in $FILES
do
  if [ $f != $BASEDIR/*.sh -a $f != "$BASEDIR/install" ]; then
    target="$HOME/.`basename $f`"
    if [ -L $target ]; then
      echo "$target already installed"
    elif [ -f $target -o -d $target ]; then
      mv $target "${target}.old"
      echo "Replacing $target (backup to ${target}.old)"
      ln -s $f $target
    else
      echo "Installing $target"
      ln -s $f $target
    fi
  fi
done
if [ ! -x "$HOME/bin/ack" ]; then
  mkdir -p $HOME/bin
  echo "Installing ack (standalone)"
  curl http://betterthangrep.com/ack-standalone > $HOME/bin/ack
  chmod 0755 $HOME/bin/ack
fi
