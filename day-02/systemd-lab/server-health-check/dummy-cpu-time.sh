#!/bin/bash

total=$(awk '$1=="cpu" {print $2+$3+$4+$5}' /proc/stat)
idle=$(awk '$1=="cpu" {print $5}' /proc/stat)

echo "Total CPU time: $total"
echo "Idle CPU time: $idle"

busy=$((total-idle))

echo "Busy CPU time: $busy"
