#!/bin/bash

won=0
player="X"
turns=1
field=(1 2 3 4 5 6 7 8 9)

. ./graph.sh
. ./functions.sh

function friend_play {
    draw ${field[@]}
    while [[ $turn -lt 9 ]]
    do
        read -p "Введите номер ячейки: " number
        turn $number
        isok=$?
        draw ${field[@]}
        check_win $field
        if [[ $win == 1 ]]
        then
            echo "Выиграл игрок $player"
            exit
        fi
        turn_go $isok $player
    done
    echo "Ничья!"
    exit

}


function turn {
    square=$1


    if [[ ! -n "$square" ]]
    then
        return 2
    elif [[ "$square" -gt "9" || "$square" -lt "1" ]]
    then
        return 3
    fi

    if [[ ${field[square-1]} != "X" && ${field[square-1]} != "O" ]]
    then
        field[$((square-1))]=$player
        return 0
    else
        return 1
    fi
}


