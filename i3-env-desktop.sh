#! /usr/bin/env bash

function list_desktop_files () {
find  ~/Desktop /usr/share/applications ~/games ~/.local/share/applications ~/.local/share/Steam   -name '*.desktop' | xargs -d'\n' cat | grep "^\(Name\|Exec\)=" | tr '\n' '~' | sed 's ~Name= \n g' | sed 's ~Exec= ~ g' | grep '~.' | cut -f1,2 -d'~' | sed 's ^Name=  '
}



to_run=`list_desktop_files | sed 's/ *%[fFuU] *//g' | sed 's/~/ (/g;s/$/)/g;s/(..............*)//g' |  sort | uniq | rofi -dmenu -no-custom -i`


echo "$to_run"
to_run=$(echo "$to_run" | sed 's/ *(.*) *//;s/^ *//;s/ *$//;')
echo "$to_run"

if [ -z "$to_run" ]
then
	echo "No application was selected"
else
	echo "Selected $to_run"
	command=`list_desktop_files | sort | grep "$to_run" | cut -f2 -d'~' | head -n1 | sed 's %[fFuU]  g'`
	command=`echo $command | sed 's/git-cola --prompt/git-cola/'`
	echo "Running command: $command"
	i3-env $command
fi
cd -
