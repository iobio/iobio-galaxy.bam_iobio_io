#!/bin/bash

while true; do
	sleep 60
	netstat -t | grep ':8004'
	if [ $? != 0 ]; then
		kill $(cat /var/run/supervisord.pid)
	fi
done



