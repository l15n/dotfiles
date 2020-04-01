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
	if [ $f != $BASEDIR/install.sh ]; then
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
