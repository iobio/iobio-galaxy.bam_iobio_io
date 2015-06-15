#!/bin/bash
visited=1
while true; do
	sleep 60
	timestamp=$(date +%T)
	netstat -t | grep ':8004'
	ret=$?
	echo "[${timestamp}] visited=${visited}, ret=${ret}"
	if [ $ret != 0 -a $visited -eq 1 ]; then
		echo "[${timestamp}] network connection terminated. shutting down..."
		kill $(cat /var/run/supervisord.pid)
	elif [ $ret == 0 -a $visited -eq 0 ]; then
		echo "[${timestamp}] network connection established. setting visited to 1"
		visited=1
	fi
done



