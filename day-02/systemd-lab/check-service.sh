#!/bin/bash

if [ "$#" -ne 1 ]
then
	echo "Usage: $0 <service-name>"
	exit 1
fi


service="$1"

if systemctl is-active --quiet "$service"
then
	echo "$service is running"
else
	echo "$service is NOT running"
fi
