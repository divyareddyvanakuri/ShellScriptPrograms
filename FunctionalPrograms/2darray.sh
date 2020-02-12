#!/bin/bash
#A simple script for  2D array to read and display

#reading variables the number of columns and rows
read -p "enter number of columns:" m
read -p "enter number of rows:" n
#to create an array using  in-built function "declare"
declare -A array
#loop for to add values to the array
#loop for columns
for (( i = 0; i < m; i++ )); do
	#loop for rows
	for (( j = 0; j < n; j++ )); do
		#read the argumnets
		read -p "enter value: " number
		array[$i,$j]=$number
	done
done
#to display the arguments inside an array
for (( i = 0; i < m; i++ )); do
	for (( j = 0; j < n; j++ )); do
		#print
		echo "${array[$i,$j]}"
	done
done
