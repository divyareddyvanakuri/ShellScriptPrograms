#!/bin/bash
#A simple script for Sum of three Integer adds to ZERO

#method for to add integers
isSumZero(){
	count=0
    for (( i = 0; i < size; i++ )); do
    	for (( j = $i+1; j < size; j++ )); do
    		for (( k = $i+2; k < size; k++ )); do
    			if [[ $(( ${array[$i]}+${array[$j]}+${array[$k]} )) -eq 0 ]];then
    				echo "distinct triplets  ${array[$i]},${array[$j]},${array[$k]}"
    				count=`expr $count + 1`
    			fi
    		done
    	done
    done
}
#reading the size of array
read -p "Enter the size : " size
#to declare an array
declare -a array
#loop for pass arguments to an array
for (( i = 0; i < size; i++ )); do
	read number
	array[$i]="$number"
done
#method for sum and passing the arrguments to it
isSumZero array size
#displays the count of Sum of three Integer adds to ZERO
echo "distinct triplets count $count"