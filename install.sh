#!/bin/bash
CURRENT_FILE="$PWD/$0"
BASEDIR=`dirname $CURRENT_FILE`
FILES="$BASEDIR/*"
for f in $FILES
do
  if [ $f != $BASEDIR/install.sh -a $f != $BASEDIR/update_servers.sh -a $f != "$BASEDIR/install" ]; then
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
mkdir -p $HOME/bin
mkdir -p $HOME/opt/bin
if [ ! -x "$HOME/bin/ack" ]; then
  echo "Installing ack (standalone)"
  curl http://betterthangrep.com/ack-standalone > $HOME/bin/ack
  chmod 0755 $HOME/bin/ack
fi

if [ ! -x "$HOME/bin/hub" ]; then
  echo "Installing hub (standalone)"
  curl http://defunkt.io/hub/standalone -sLo $HOME/bin/hub
  chmod 0755 $HOME/bin/hub
fi
