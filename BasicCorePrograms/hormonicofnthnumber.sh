#!/bin/bash
#hormonic of nth number	
echo "enter nth hormonic number"
read range
if [ $range -le 0 ]
then
	echo "Invalide,hormonic number needs to greater then zero"
else
	hormonic=0
	while [ $range -ne 0 ]
	do
		PI=$(echo "scale=2; 1/$range" | bc)
		hormonic=$(echo "$PI + $hormonic" | bc -l)
		range=`expr $range - 1`
	done
	echo $hormonic
fi