#! /usr/bin/env bash

current_display=`i3-msg -t get_workspaces | emuto 'filter ($ => $.focused) | $[0].output | [$]' -o=raw`
active_displays=`~/repos/perfect-arch-config/list_active_displays.sh`
available_displays=`echo $active_displays | sed "s/ /\n/g" | grep -v $current_display`
message=`echo $available_displays | sed "s/ /\n/g" | sed "s/^/move workspace to output /" | rofi -dmenu`

if [ -z "$message" ]
then
	echo "Not sending message to i3 because no message was selected"
else
	echo "Sending message to i3: $message"
	i3-msg $message
fi
cd -
