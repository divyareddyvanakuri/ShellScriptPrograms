#!/bin/sh
# script to Flip Coin and print percentage of Heads and Tails
coinflips(){
    hcount=0
    tcount=0
    Nflips=0
    while [ "$Nflips" -lt "$tries" ]
    do
        Nflips=`expr $Nflips + 1`
        # flip a coin
        flip=$(($(($RANDOM%10))%2))
        # if heads,
        if [ $flip -eq 1 ]
        then
            #head count
            hcount=`expr $hcount + 1`
        # else tail,
        else
            #tail count
            tcount=`expr $tcount + 1`
        fi
    done
    # echo "$flips"
    # echo "$hcount"
    # echo "$tcount"
    var=$(echo "scale=2;$hcount / $Nflips" | bc)
    phead=$(echo "$var*100" | bc)
    ptail=$(echo "100-$phead" | bc)
    echo "percentage of head:$phead"
    echo "percentage of tail:$ptail"
}
read -p "enter numner of tries:" tries
coinflips tries