#! /usr/bin/env bash

cd ~/repos/perfect-arch-config/dotfiles/wpgtk/.config/wpg/wallpapers
wallpaper=`wpg -l | sed 's \(.*\) IMG:\1\t\1 ' | dmenu -is 256`

if [ -z "$wallpaper" ]
then
	echo "Not changing wallpaper because no wallpaper was selected"
else
	echo "Selected $wallpaper"
	wpg -s $wallpaper
fi
cd -
