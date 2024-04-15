function turn_go {
    play=$2
    case $1 in
        0)
            if [[ $play == "X" ]]
            then
                player="O"
            else
                player="X"
            fi
            turn=$(($turn+1))
            ;;
        1)
            echo "Ячейка уже использована, выберите другую"
            ;;
        2)
            echo "Номер ячейки не должен быть пуст"
            ;;
        3)
            echo "Номер ячейки должен являться цифрой от 1 до 9"

    esac
}

function check_win {
    field=$1
    if [[ ${field[0]} == ${field[1]} && ${field[0]} == ${field[2]} ]]
    then
        win=1
    elif [[ ${field[3]} == ${field[4]} && ${field[3]} == ${field[5]} ]]
    then
        win=1
    elif [[ ${field[6]} == ${field[7]} && ${field[6]} == ${field[8]} ]]
    then
        win=1
    elif [[ ${field[0]} == ${field[3]} && ${field[0]} == ${field[6]} ]]
    then
        win=1
    elif [[ ${field[1]} == ${field[4]} && ${field[1]} == ${field[7]} ]]
    then
        win=1
    elif [[ ${field[2]} == ${field[5]} && ${field[2]} == ${field[8]} ]]
    then
        win=1
    elif [[ ${field[0]} == ${field[4]} && ${field[0]} == ${field[8]} ]]
    then
        win=1
    elif [[ ${field[2]} == ${field[4]} && ${field[2]} == ${field[6]} ]]
    then
        win=1
    fi
}
