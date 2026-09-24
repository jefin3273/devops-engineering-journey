#!/bin/bash

echo "================================"
echo "      SERVER HEALTH REPORT"
echo "================================"

show_system_info(){
    echo "Hostname: $(hostname)"
    echo "User: $(whoami)"
    echo "Uptime: $(uptime)"
}

check_memory(){
	echo
	echo "Memory: "
	free -h
}

check_disk(){
	echo
	echo "Disk: "
	df -h
}

check_services(){
	echo
	echo "Services: "
	for service in "$@"
	do
        	check_service "$service"
	done
}

check_service(){
	state=$(systemctl show "$1" --property=LoadState --value)
	if [ "$state" = "not-found" ]
	then
		echo "? $1 NOT FOUND"
	elif systemctl is-active --quiet "$1"
	then
		echo "✓ $1 RUNNING"
	else
		echo "✗ $1 DOWN"
	fi
}

check_port(){
	if ss -lnt | grep -q ":$1 "
	then
		echo "✓ Port $1 LISTENING"
	else
		echo "✗ Port $1 NOT LISTENING"
	fi
}

check_ports(){
	echo
	echo "Ports: "

	for port in "$@"
	do
		check_port "$port"
	done
}

check_disk_usage(){
	echo
	echo "Disk Health: "

	disk_usage=$(df -P / | awk 'NR==2 {print $5}' | tr -d '%')
	file=$(df -P / |awk 'NR==2 {print $1}')
	if [ "$disk_usage" -ge 85 ]
	then 
		echo "$file -> Critical"
	elif [[ "$disk_usage" -ge 70 && "$disk_usage" -lt 85 ]]
	then
		echo "$file ->  Warning"
	else
		echo "$file -> Normal"
	fi
}

check_memory_health(){
	echo
	echo "Memory Health: "
	echo "Memory Usage: "
	total=$(free | awk 'NR==2 {print $2}')
	available=$(free | awk 'NR==2 {print $7}')
	used=$((total-available))
	usage=$((used * 100/total))
	if [ "$usage" -ge 85 ]
	then
		echo "$usage% -> Critical"
	elif [[ "$usage" -ge 70 && "$usage" -lt 85 ]]
	then
		echo "$usage% -> Warning"
	else
		echo "$usage% -> Normal"
	fi
}

show_system_info
check_memory
check_disk
check_services "$@"
check_ports 22 8080 80 443
check_disk_usage
check_memory_health

echo
echo "================================"
