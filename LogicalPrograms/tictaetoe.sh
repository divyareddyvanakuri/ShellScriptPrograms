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