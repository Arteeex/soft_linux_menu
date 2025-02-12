#!/bin/bash

#read-menu: Программа вывода системной информации, управляемая с помощью меню

clear
echo "
Пожалуйста выберите: 

1. Системная информация
2. Свободное место
3. Температура
0. Выход
"
read -p "Выберите цифру [0-3] > "

if [[ "$REPLY" =~ ^[0-3]$ ]]; then
	if [[ "$REPLY" == 0 ]]; then
	echo "Программа завершила работу."
	exit
        fi

	if [[ "$REPLY" == 1 ]]; then
	echo "Hostname: $HOSTNAME"
	uptime
	exit
	fi

	if [[ "$REPLY" == 2 ]]; then
	echo "Свободное место."
	df -h
	exit
	fi
	
	if [[ "$REPLY" == 3 ]]; then
	watch -d -n 2 sensors
	exit
	fi
else
	echo "Программа завершилось с ошибкой" >&2
	exit 1
	fi











