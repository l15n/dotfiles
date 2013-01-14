#!/bin/bash
CURRENT_FILE="$PWD/$0"
BASEDIR=`dirname $CURRENT_FILE`
FILES="$BASEDIR/*"

__link_with_backup() {
	local f=$1
	local target=$2
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
}

__link_dotfile() {
	local f=$1
	if [ $f != $BASEDIR/install.sh -a $f != $BASEDIR/update_servers.sh -a $f != "$BASEDIR/install" ]; then
		local target="$HOME/.`basename $f`"
		__link_with_backup $f $target
	fi
}


for f in $FILES; do
	__link_dotfile $f
done

mkdir -p $HOME/bin
mkdir -p $HOME/opt/bin
mkdir -p $HOME/.ssh
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

if [ -a "$HOME/.ssh_config" ]; then
	__link_with_backup $HOME/.ssh_config $HOME/.ssh/config
fi

# Compile tmux MacOSX pasteboard
if [ -a "$HOME/.modules/tmux-pasteboard/Makefile" ]; then
	(cd ~/.modules/tmux-pasteboard; make reattach-to-user-namespace && cp reattach-to-user-namespace ~/bin)
fi
