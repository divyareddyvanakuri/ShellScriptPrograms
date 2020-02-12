#!/bin/bash
#A simple script for distance calculation from points(x,y) to origin

#reading the points(x,y) variables
read -p "enter x value:" x
read -p "enter y value:" y
#equation for distance calculation
c=$(($((x * x))+$((y * y))))
#to disaly decimal values also
d=$(echo "scale=2;sqrt($c)" | bc)
#print distance
echo "$d"