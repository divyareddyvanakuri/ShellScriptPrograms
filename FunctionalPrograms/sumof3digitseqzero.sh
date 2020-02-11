#!/bin/bash
#Sum of three Integer adds to ZERO

isSumZero(){
	# echo "${array[@]}"
	# echo "$size"
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
read -p "Enter the size : " size
declare -a array
for (( i = 0; i < size; i++ )); do
	read number
	array[$i]="$number"
done
isSumZero array size
echo "distinct triplets count $count"