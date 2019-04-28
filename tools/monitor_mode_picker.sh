#! /usr/bin/env bash

monitor_mode=`autorandr | rofi -dmenu | sed 's/ .*//g'`

if [ -z "$monitor_mode" ]
then
	echo "Not changing monitor mode because no monitor mode was selected"
else
	echo "Selected $monitor_mode"
	~/repos/perfect-arch-config/switch_monitor_mode.sh $monitor_mode
fi
cd -
