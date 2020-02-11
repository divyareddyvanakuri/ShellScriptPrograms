#!/bin/bash
read -p "enter your goal stack:" goal
read -p "enter number of stacks you have:" stack
win=0
count=0
while [[ $stack -gt 0 ]]
do
	count=`expr $count + 1`
	die=$(( RANDOM % (4 - 1 + 1 ) + 1 ))
	stack=`expr $stack - 1`
	echo
    read -p "enter first guess:" choice1
    echo
    read -p "enter first guess:" choice2
    echo 'die rolling done..'
    if [ $choice1 -eq $die -o  $choice2 -eq $die ]
	then
       	stack=`expr $stack + 1`
        echo "rolled one $die"
        echo "win! you won \$1, you're new balance is:$stack"
        win=`expr $win + 1`
    else
        stack=`expr $stack - 1`
        echo 'rolled one:$die'
       	echo "lose! you lost $1, you're new balance is:$stack"
    fi
    if [ $stack -lt 0 ]
    then
            echo'Bankrupt.'
            break
    fi
    if [ $stack -eq $goal ]
    then
           echo 'Millionaire!'
            break  
    fi
done 
echo "number of wins:$win"
perwin=$(($win/$count*100))
perloss=`expr 100 - $perwin`
echo "percentag of win:$perwin"
echo "percentage of loss:$perloss"
