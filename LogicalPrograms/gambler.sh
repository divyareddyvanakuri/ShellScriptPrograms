#!/bin/bash
# the simple script for Gambler 

#method for to Print Number of Wins and Percentage of Win and Loss.
gambler(){
win=0
count=0
#gmabler can play until stacks equal to zero
while [[ $stack -gt 0 ]]
do
	count=`expr $count + 1`
    #rolling a die
	die=$(( RANDOM % (4 - 1 + 1 ) + 1 ))
	
	#first chance for gmabler to gusses a number
    echo
    read -p "enter first guess:" choice1

    #second chance for gmabler to gusses a number
    echo
    read -p "enter first guess:" choice2
    echo 'die rolling done..'
    #if gusses is correct
    if [ $choice1 -eq $die -o  $choice2 -eq $die ]
	then
        #stack increment
       	stack=`expr $stack + 1`
        echo "rolled one $die"
        echo "win! you won \$1, you're new balance is:$stack"
        win=`expr $win + 1`
    #else gusses is wrong
    else
        #stack decrement
        stack=`expr $stack - 1`
        echo 'rolled one:$die'
       	echo "lose! you lost $1, you're new balance is:$stack"
    fi
    #paly util  the gambler is broke 
    if [ $stack -lt 0 ]
    then
            echo'Bankrupt.'
            break
    fi
    #paly util the gambler reach goal
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
}

#reading the $goal and $stack variables
read -p "enter your goal stack:" goal
read -p "enter number of stacks you have:" stack

#passing the two arguments to the gmabler method
gambler goal stack