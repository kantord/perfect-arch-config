#! /usr/bin/env bash

show_index=1

next_event_line=`khal list --notstarted now -f "{start-date};={start-time};{title}"  | grep -v "No meetings day /blocker/" | grep = | grep -v ";=;" | head -n1 | sed 's ;= ; ' | sed 's/;/ /'`
next_event_datetime=`echo $next_event_line | cut -f1 -d";"`
next_event_title=`echo $next_event_line | sed 's/\[regular\]$//' | cut -f2 -d";" | cut -c -30`
next_event_time=`date '+%s' -d "$next_event_datetime"`
now_time=`date '+%s' -d "now"`
time_difference=$(($next_event_time - $now_time))
time_difference_minutes=$(($time_difference / 60))
time_difference_hours=$(($time_difference_minutes / 60))
time_difference_minutes_adjusted=$(($time_difference_minutes - ($time_difference_hours * 60) ))
time_difference_formatted=`echo "$time_difference_hours"h "$time_difference_minutes_adjusted"m | sed 's/^0h //'`

now_line=`khal at -f "{start-date};={start-time};{title}" | grep -v "No meetings day /blocker/" | grep = | grep -v ";=;" | head -n1 | sed 's ;= ; ' | sed 's/;/ /' | sed 's/\[regular\]$//'`
now_title=`echo $now_line | cut -f2 -d";" | cut -c -30 | sed 's/$/  /' | sed 's/^/Now: /' | sed 's/Now: *$//'`

next_summary=`echo "📅 In $time_difference_formatted:" $next_event_title | sed 's/.*[0-9][0-9]\+h.*//' | grep -v "\-[0-9']\+h"`
calendar_summary=`echo "$now_title""$next_summary"`

day_summary=""
EVENTS_TODAY=`khal list today -f "{start-date};={start-time};{end-time};{title}" | sed '/Tomorrow/q' | grep "=" | cut -f2 -d"=" | grep -v "No meetings day /blocker/"`
let FIRST_HOUR=7
let LAST_HOUR=23
let START="2*FIRST_HOUR"
let END="2*LAST_HOUR"
let WORK_START="2*10"
let WORK_END="2*18"
let LUNCH_BREAK_START="2*13"
let LUNCH_BREAK_END="LUNCH_BREAK_START + 2"
HOUR=`date +"%H" | sed 's/^0//'`
MINUTE=`date +"%M" |sed  's/^0//'`
let CURRENT_TIME="2*HOUR+1"
if [ "$MINUTE" -gt "30" ]; then
	let CURRENT_TIME="1+CURRENT_TIME"
fi

for i in $(eval echo "{$START..$END}")
do
	time_symbol="🟩"
	if [ "$i" -eq "$START" ]; then
		time_symbol="⏰"
	fi
	if [ "$i" -gt "$WORK_START" ]; then
		time_symbol="🟦"
	fi
	if [ "$i" -ge "$LUNCH_BREAK_START" ]; then
		if [ "$i" -lt "$LUNCH_BREAK_END" ]; then
			time_symbol="🍴"
		fi
	fi
	if [ "$i" -gt "$WORK_END" ]; then
		time_symbol="🟩"
	fi
	if [[ $(date +%u) -gt 5 ]]; then
		time_symbol="🟩"
	fi
	if [ "$i" -eq "$END" ]; then
		time_symbol="💤"
	fi
	while IFS= read -r meeting; do
		if test -z "$meeting" 
		then
		      continue
		fi
		meeting_start=`echo $meeting | cut -f1 -d';'`
		meeting_end=`echo $meeting | cut -f2 -d';'`
		SEC1=`date +%s -d ${meeting_start}`
		SEC2=`date +%s -d ${meeting_end}`
		DIFFSEC=`expr ${SEC2} - ${SEC1}`
		let TOTAL_BLOCKS="$DIFFSEC / 1800"
		if [ "$TOTAL_BLOCKS" -eq "0" ]; then
			TOTAL_BLOCKS=1
		fi
		let EXTRA_BLOCKS="$TOTAL_BLOCKS - 1"
		HOUR=`echo $meeting_start | cut -f1 -d':' | sed 's/^0//'`
		MINUTE=`echo $meeting_start | cut -f1 -d':'`
		let MEETING_TIME="2*HOUR+1"
		let MEETING_END_TIME="MEETING_TIME+EXTRA_BLOCKS"
		if [ "$MINUTE" -gt "30" ]; then
			let MEETING_TIME="1+MEETING_TIME"
		fi

		if [ "$i" -ge "$MEETING_TIME" ]; then
			if [ "$i" -le "$MEETING_END_TIME" ]; then
				time_symbol="📅"
			fi
		fi

	done <<< "$EVENTS_TODAY"
	if [ "$i" -eq "$CURRENT_TIME" ]; then
		time_symbol="🚀"
	fi
	day_summary="$day_summary$time_symbol"
done

cat <(cat <(echo $day_summary) <(echo $calendar_summary) <(cat /tmp/last_notification.txt | sed 's/$/\n/' | sed 's/^/🔔 /' | grep -v '^🔔 $') <(i3-gnome-pomodoro status | sed 's/^/🍅 /' | grep -v "^🍅 $") | grep -v '^$' | tail -n $show_index) <(echo "") | head -n1
