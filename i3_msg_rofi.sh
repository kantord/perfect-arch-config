#! /usr/bin/env bash

message=`~/repos/perfect-arch-config/list_active_displays.sh | sed "s/^/move workspace to output /" | rofi -dmenu`

if [ -z "$message" ]
then
	echo "Not sending message to i3 because no message was selected"
else
	echo "Sending message to i3: $message"
	i3-msg $message
fi
cd -
