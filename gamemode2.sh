#!/bin/bash

. ./graph.sh
. ./functions.sh

function friend_play {
    local player="X"
    local turns=1
    local field=(1 2 3 4 5 6 7 8 9)

    draw ${field[@]}

<<<<<<< HEAD
    while [[ $turn -lt 9 ]]
=======
    while [[ $turns -lt 9 ]]
>>>>>>> v1
    do
        read -p "Введите номер ячейки: " square
        turn_go $square ${field[@]}
        if [[ $? -eq 0 ]]
        then
            field[$((square-1))]=$player

            draw ${field[@]}
<<<<<<< HEAD
            turn=$(($turn+1))
=======
            turn=$(($turns+1))
>>>>>>> v1

            check_win ${field[@]}

            if [[ $? -eq 1 ]]
            then
                echo "Победил игрок $player"
                return 0
            fi

            if [[ $player == "X" ]]
            then
                player="O"
            else
                player="X"
            fi
        fi

    done
    echo "Ничья!"
    return 0

}
