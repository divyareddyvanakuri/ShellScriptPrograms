#!/bin/bash
#script to primefactors of a number
echo "enter an integer:"
read input
if [ $input -lt 1 ]
then
echo "not allowed!"
fi
# find factors and prime

i=2
count=0
flag=0
while [ $i -lt  $input ]
do
  if [ `expr $input % $i` -eq 0 ]
  then
      factor=$i
  j=2
  while [ $j -le  `expr $factor / 2`  ]
  do
      flag=0
      if [ `expr $factor % $j` -eq 0 ]
      then
      flag=1
      break
      fi
      j=`expr $j + 1`
  done
  if [ $flag -eq 0 ]
  then
  echo "[ $factor ]"
  count=1
  fi
  fi
  i=`expr $i + 1`
  done
  if [ $count -eq 0 ]
  then
  echo "no prime factors found except 1 and $input"
  fi