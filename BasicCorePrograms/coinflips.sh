#!/bin/sh
# script to Flip Coin and print percentage of Heads and Tails
coinflips(){
    hcount=0
    tcount=0
    flips=0
    while [ "$flips" -lt "$tries" ]
    do
        flips=`expr $flips + 1`
        coin=$(( RANDOM % (1 - 0 + 1 ) + 0 ))
        if [ $coin -eq 1 ]
        then
        	hcount=`expr $hcount + 1`
        else
        	tcount=`expr $tcount + 1`
        fi
    done
    phead=$(awk -v hcount="${hcount}" -v  flips="${flips}" 'BEGIN{print ((hcount/flips)*100)}')
    ptail=$((100-$phead))
    echo "percentage of head:$phead"
    echo "percentage of tail:$ptail"
}
read -p "enter tries:" tries
coinflips tries