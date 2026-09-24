#!/bin/bash

count=1

while [ $count -le 5 ]
do
    echo "Iteration: $count"
    sleep 2
    count=$((count + 1))
done

echo "Loop finished"
