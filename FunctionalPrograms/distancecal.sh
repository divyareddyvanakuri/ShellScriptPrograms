#!/bin/bash
read -p "enter x value:" x
read -p "enter y value:" y
c=$(($((x * x))+$((y * y))))
d=$(echo "scale=2;sqrt($c)" | bc)
echo "$d"