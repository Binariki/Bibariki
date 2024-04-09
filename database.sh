#!/bin/bash


function top_plyers() {
    local count=0

    for list in $(ls ./users)
    do
        
        list_users[$count]=$list
        list_ach[$count]=$(cat ./users/$list/ach.txt)
        count=$(($count + 1))


    done
    count=$(($count - 1))

    
    for ((repeat=0; $repeat<$(($count)); repeat++))
    do
        for ((check_max=0; $check_max<$(($count - $repeat)); check_max++))
        do

            if [[ ${list_ach[$check_max]} -lt ${list_ach[$(($check_max + 1))]} ]]
            then 

                repeter=${list_ach[$check_max]}
                list_ach[$check_max]=${list_ach[$(($check_max + 1))]}
                list_ach[$(($check_max + 1))]=$repeter

                repeter=${list_users[$check_max]}
                list_users[$check_max]=${list_users[$(($check_max + 1))]}
                list_users[$(($check_max + 1))]=$repeter


            fi
        done
    done
    
    for ((permutation=0; permutation<=$count; permutation++))
    do
        echo "${list_users[$permutation]}: ${list_ach[$permutation]}"

    done
    return 0
}



top_plyers




function photo {
    local name=$1
    local approval=0
    local today=$(date)

    while [[ $approval != "n" && $approval != "y" && $approval != "Y" && $approval != "N" ]]
    do
    read -p "Хотите сделать фото в альбом?[y/n]: " approval
    done


    if [[ $approval = "y" || $approval = "Y" ]]
    then

    for i in 1 2 3
    do
        echo $i
        sleep 1
    done


    ffmpeg -i /dev/video0 -t 1 "./Binariki_users_photo/$name.png" 1> /dev/null 2> /dev/null
    echo " "
    echo "Фото сделанно"

    else
        return 0
    fi
}






function check_login {

    local login=$1
    db_name=./users/$login/.acc
    separator="|"
    line=$(cat $db_name)

    if [[ $line == $login$separator* ]]
    then

        echo $line
        return 0

    fi
}






function register {

    local new_password=1
    local check_new_password=0
    separator="|"
    echo "Ваш аккаунт не найдет"
    echo "Зарегистрируйтесь"

    while [[ $new_password != $check_new_password ]]
    do
        read -s -p "Введите пароль: " new_password
        echo " "
        read -s -p "Повторите пароль: " check_new_password
        echo " "
        
        if [[ $new_password != $check_new_password ]]
        then
            echo "Пароли не совпадают, введите их заново"
            echo " "
        fi
        continue

    done


    new_password=$(echo $new_password | sha256sum | awk '{print $1}')
    mkdir ./users/$name

        
    echo $name$separator$new_password > ./users/$name/.acc
    echo $result > ./users/$name/ach.txt
    
    echo "Вы успешно зарегистрировались, ваш результат зафиксирован"
    photo $name
    
}







function log_in {
    attempts=3
    separator="|"


    while [[ $attempts -ne 0 ]]
    do  

        read -s -p "Введите пароль:" password


        local password=$(echo $password | sha256sum | awk '{print $1}')
        local check_log=$(check_login $name)


        if [[ $name$separator$password == $check_log ]]
        then

            echo " " 
            echo "Вы успешно вошли"

            ach=$(cat ./users/$name/ach.txt)
            ach=$(($ach+$result))

            echo $ach > ./users/$name/ach.txt
            echo "Ваш результат успешно внесен"

            return 0

        else
            attempts=$(($attempts-1))
            echo " "

        fi
    done

        echo "Вы не смогли авторизоваться, ваш результат будет утерян)"
        return 0
}






function new_result {
    read -p "Введите ваше имя: " name
    local result=$1

    for line in $(ls users)
    do
        if [[ $name == $line ]]
        then
            log_in
            return 0
        fi
    done
    register
    return 0

}




#Избавиться от read в которые можно ничего не вводить 
#Сделать так чтобы программу во время выполнения некоторых функций нельзя было прервать 
#Доделать сортировку 
