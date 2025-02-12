#!/bin/bash

#read-menu: Программа вывода системной информации, управляемая с помощью меню

DELAY=4 # Время отображения результатов на экране (в секундах)


while true; do
clear
cat <<- _EOF_ 
 Пожалуйста выберите: 

1. Системная информация
2. Свободное место
3. Температура
0. Выход

_EOF_
read -p "Выберите цифру [0-3] > "

if [[ "$REPLY" =~ ^[0-3]$ ]]; then
	if [[ "$REPLY" == 1 ]]; then
		echo "Hostname: $HOSTNAME"
		uptime
		sleep "$DELAY"
		continue
	fi

	if [[ "$REPLY" == 2 ]]; then
		echo "Свободное место."
		df -h
		sleep "$DELAY"
		continue
	fi
	
	if [[ "$REPLY" == 3 ]]; then
		watch -d -n 2 sensors
		sleep 1
		continue
	fi
	if [[ "$REPLY" == 0 ]]; then
		break
	fi
else
	echo "Ошибка в программе."
	sleep $DELAY
fi

done
echo "Программа завершилась."










