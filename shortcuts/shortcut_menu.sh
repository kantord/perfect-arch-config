#! /usr/bin/env bash

shortcut=`cat ~/repos/perfect-arch-config/shortcuts/shortcuts.txt | cut -f1 -d'|' | rofi -dmenu`

if [ -z "$shortcut" ]
then
	echo "Not running shortcut because no shortcut was selected"
else
	echo "Selected $shortcut"
	command=`cat ~/repos/perfect-arch-config/shortcuts/shortcuts.txt | grep "$shortcut"`
	$(`echo $command | cut -f2 -d'|'`)
fi
cd -
