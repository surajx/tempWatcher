#!/bin/bash
CRITICAL_TEMP=79;
ALERT_TEMP=65
while [ 1 ]; do
	tempVal=`sensors | grep 'Physical id 0' | cut -f5 -d' ' | sed 's/+//g' | sed 's/°C//g' | cut -f1 -d'.'`;
	if [[ $tempVal -gt $CRITICAL_TEMP ]]; then
		DISPLAY=:0.0 notify-send -u critical "Critical Alert!! CPU Temp: +"$tempVal"°C";
		sleep 3;
		continue;
	fi
	if [[ $tempVal -gt $ALERT_TEMP ]]; then
		DISPLAY=:0.0 notify-send -u critical 'Alert!! CPU Temp: +'$tempVal'°C';
	fi
	sleep 10;
done
