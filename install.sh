#!/bin/bash
CURRENT_FILE="$PWD/$0"
BASEDIR=`dirname $CURRENT_FILE`
FILES="$BASEDIR/*"
for f in $FILES
do
  if [ $f != "$BASEDIR/install.sh" -a $f != "$BASEDIR/install" ]; then
    target="$HOME/.`basename $f`"
    if [ -f $target -o -d $target ]; then
      mv $target "${target}.old"
      echo "Replacing $target (backup to ${target}.old)"
      ln -s $f $target
    elif [ -L $target ]; then
      echo "$target already installed"
    else
      echo "Installing $target"
      ln -s $f $target
    fi
  fi
done
