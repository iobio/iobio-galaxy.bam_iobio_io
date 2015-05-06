#!/bin/bash
visited=0
while true; do
	sleep 60
	netstat -t | grep ':8004'
	ret=$?
	if [ $ret != 0 -a $visited -eq 1 ]; then
		kill $(cat /var/run/supervisord.pid)
	elif [ $ret == 0 -a $visited -eq 0 ]; then
		visited=1
	fi
done



