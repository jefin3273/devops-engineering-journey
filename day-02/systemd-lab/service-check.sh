#!/bin/bash

if systemctl is-active --quiet devops-demo 
then 
	echo "devops-demo is running" 
else 
	echo "devops-demo is not running"
	echo "Attempting restart...."

	sudo systemctl restart devops-demo

	if systemctl is-active --quiet devops-demo
	then 
		echo "devops-demo restarted successfully"
	else
		echo "ERROR: devops-demo failed to restart"
	fi
fi
