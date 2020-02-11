#!/bin/bash
read -p "enter number of columns:" m
read -p "enter number of rows:" n
declare -A array
for (( i = 0; i < m; i++ )); do
	for (( j = 0; j < n; j++ )); do
		read -p "enter value: " number
		array[$i,$j]=$number
	done
done
for (( i = 0; i < m; i++ )); do
	for (( j = 0; j < n; j++ )); do
		echo "${array[$i,$j]}"
	done
done
