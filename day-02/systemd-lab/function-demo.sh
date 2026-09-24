#!/bin/bash

show_system_info(){
	echo "===== SYSTEM INFORMATION ====="
	echo "Hostname: $(hostname)"
	echo "User: $(whoami)"
	echo "Current Directory: $(pwd)"
	echo "Current Date: $(date)"
	echo "Uptime: $(uptime)"
}

show_system_info
