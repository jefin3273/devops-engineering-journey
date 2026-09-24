#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Usage: $0 <service>"
	exit 1
fi

check_service(){
	if systemctl is-active --quiet "$1"
	then 
		echo "$1 is running"
	else
		echo "$1 is not running"
	fi
}

for service in "$@"
do
	check_service "$service"
done
