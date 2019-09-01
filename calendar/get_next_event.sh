#! /usr/bin/env bash

next_event_line=`khal list --notstarted -f "{start-date};={start-time};{title}" | grep = | grep -v ";=;" | head -n1 | sed 's ;= ; ' | sed 's/;/ /'`
next_event_datetime=`echo $next_event_line | cut -f1 -d";"`
next_event_title=`echo $next_event_line | cut -f2 -d";" | cut -c -30`
next_event_time=`date '+%s' -d "$next_event_datetime"`
now_time=`date '+%s' -d "now"`
time_difference=$(($next_event_time - $now_time))
time_difference_minutes=$(($time_difference / 60))
time_difference_hours=$(($time_difference_minutes / 60))
time_difference_minutes_adjusted=$(($time_difference_minutes - ($time_difference_hours * 60) ))
time_difference_formatted=`echo "$time_difference_hours"h "$time_difference_minutes_adjusted"m | sed 's/0h //'`

echo "Next event:" $next_event_title - $time_difference_formatted"  "
