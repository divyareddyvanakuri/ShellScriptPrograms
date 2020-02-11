#!/bin/bash
#power of 2
echo "enter power of 2 nth range number:"
read range
a=1
while [ $a -le $range ]
do 
	echo "2 the power of $a:"
	echo "2^$a" | bc
	a=`expr $a + 1`
done