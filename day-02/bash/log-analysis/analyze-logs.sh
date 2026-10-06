#!/bin/bash

if [ "$#" -ne 1 ]
then
    echo "Usage: $0 <log-file>"
    exit 1
fi

log_file="$1"

if [ ! -f "$log_file" ]
then
    echo "ERROR: Log file '$log_file' does not exist."
    exit 1
fi

total=$(wc -l < "$log_file")
info=$(grep -c "INFO" "$log_file")
warn=$(grep -c "WARN" "$log_file")
error=$(grep -c "ERROR" "$log_file")

echo "================================"
echo "       LOG ANALYSIS REPORT"
echo "================================"
echo
echo "Total log entries : $total"
echo "INFO messages     : $info"
echo "WARN messages     : $warn"
echo "ERROR messages    : $error"

if [ "$error" -gt 0 ]
then
    echo
    echo "Status            : CRITICAL"
    exit 2
elif [ "$warn" -gt 0 ]
then
    echo
    echo "Status            : WARNING"
    exit 1
else
    echo
    echo "Status            : HEALTHY"
    exit 0
fi
