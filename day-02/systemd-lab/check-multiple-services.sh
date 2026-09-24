#!/bin/bash

if [ "$#" -eq 0 ]
then
	echo "Usage: $0 <service-1> <service-2> ...."
	exit 1
fi

for service in "$@"
do
	if systemctl is-active --quiet "$service"
	then
		echo "$service is running"
	else
		echo "$service is NOT running"
	fi
done
