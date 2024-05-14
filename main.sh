
. ./gamemode2.sh
. ./gamemode1.sh
. ./database.sh

clear
echo "Добро пожаловать в Binariki"
while :
do
    read -p "Введите 1, чтобы играть с ботом или 2, чтобы играть с другом, 3, чтобы показать таблицу лидеров, 4, чтобы выйти: " gamemode

    case $gamemode in
        1)
            bot_play
            ;;

        2)
            friend_play
            ;;

        3)
            top_players
            ;;
        
        *)
            echo "Неопознанный аргумент"
            exit 1
    esac
done



