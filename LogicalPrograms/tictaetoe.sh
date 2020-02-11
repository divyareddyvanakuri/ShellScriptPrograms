#!/bin/bash 
theboard(){
    echo "${board[0]} | ${board[1]} | ${board[2]}"
    echo "--|---|--"
    echo "${board[3]} | ${board[4]} | ${board[5]}"
    echo "--|---|--"
    echo "${board[6]} | ${board[7]} | ${board[8]}"
    echo "--|---|--"
    
}
whogofirst(){
	rand=$(( RANDOM % (1 - 0 + 1 ) + 0 ))
    if  [ $rand  -eq 0 ]
    then
        turn="computer"
    else 
        turn="player"
    fi
}
isboardfull(){
	for i in {0..8}
	do
		if [ "${board[$i]}"  = "$i" ]
		then
			return="Flase"
		else
			return="True"
		fi
	done
}
isWinner(){
    		if [ "${board[0]}" = "$mark" -a "${board[1]}" = "$mark" -a  "${board[2]}" = "$mark" ]
    		then
    			game="win"
    		elif [ "${board[3]}" = "$mark" -a "${board[4]}"  = "$mark" -a  "${board[5]}" = "$mark" ]; then
    			game="win"
    		elif [ "${board[6]}" = "$mark" -a "${board[7]}"  = "$mark" -a  "${board[8]}" = "$mark"  ]; then
    			game="win"
    		elif [ "${board[0]}" = "$mark" -a "${board[3]}"  = "$mark" -a  "${board[6]}"  = "$mark"  ]; then
    			game="win"
    		elif [ "${board[1]}" = "$mark" -a "${board[4]}"  = "$mark" -a  "${board[7]}" = "$mark" ]; then
    			game="win"
    		elif [ "${board[2]}" = "$mark" -a "${board[5]}"  = "$mark" -a  "${board[8]}" = "$mark" ]; then
    			game="win"
    		elif [ "${board[0]}" = "$mark" -a "${board[4]}"  = "$mark" -a  "${board[8]}" = "$mark"  ]; then
    			game="win"
    		elif [ "${board[2]}" = "$mark" -a "${board[4]}"  = "$mark" -a  "${board[6]}" = "$mark" ]; then
    			game="win"
    		else
    			game="running"
    		fi
}
CheckPosition(){ 
    if [ "${board[$choice]}" = "$choice" ]
    then  
        return="True"
    else
        echo "shell was not empty,so please enter another position value to move forward"
        return="False"
    fi
}
playAgain(){
    echo 'Do you want to play again? (yes or no)'
   	read playgame
}
playgame="yes"
while [ "$playgame" = "yes" ]
do
    
    board=($(seq 0 8 ))
    whogofirst
    gameIsPlaying=True
    while [ "$gameIsPlaying" = "True" ]
    do
        if [ "$turn" = "computer" ]
        then
            echo "computer"
            mark="x"
            read -p "enter position between [0-8]:" choice
            CheckPosition choice
            if [ "$return" = "True" ]
            then
                board[$choice]=$mark
                isWinner board mark
                if [ "$game" = "win" ]
                then
                    theboard board 
                    echo "computer won the game!"
                    gameIsPlaying="False"
                else
                	isboardfull board
                    if [ "$return" = "True" ]
                    then
                        theboard board
                        echo "game is tie"
                        break
                    else
                        turn="player"
                    fi
        		fi    
        	fi  
    
    	else
            echo "player"
            mark="o"
            read -p "enter position between [0-8]:" choice
            CheckPosition choice
            if [ "$return" = "True"  ]
            then
                board[$choice]=$mark
                isWinner board mark 
                if [ "$game" = "win" ]
                then
                    theboard board 
                    echo "player won the game!"
                    gameIsPlaying=False
                else
                	isboardfull board
                    if [ "$return" = "True" ]
                    then
                        theboard board
                        echo "game is tie"
                        break
                    else
                        turn="computer"
                    fi
        		fi    
        	fi 
       	
    	fi
    done 
    playAgain     
    if [ "$playgame" = "no" ]
    then
        break
    fi
done