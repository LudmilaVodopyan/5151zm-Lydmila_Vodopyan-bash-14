#!/bin/bash

echo "5151zm-Lydmila_Vodopyan-bash-14 :"
echo
echo "============================="
echo "Навигатор по файловой системе"
echo "============================="
echo

function cdto() {
    cd $1
}

tryagain=true
while $tryagain; do
    echo "Выберите действие:"
    echo "  (1) Показать текущий каталог"
    echo "  (2) Перейти в родительский каталог"
    echo "  (3) Перейти в каталог"
    read choice
    if [[ $choice == "1" ]]; then
	echo "Содержимое текущего каталога (${PWD}):";
	ls -l1 $PWD/
	echo
    elif [[ $choice == "2" ]]; then
	cdto ..
        echo "$(tput setaf 2)Теперь вы в каталоге $PWD $(tput setaf 7)"
	echo
    elif [[ $choice == "3" ]]; then
	echo "В текущем каталоге доступны следующие подкаталоги(введите имя одного из них):"
	    ls -1d */ 2>/dev/null
	    if [[ $? -gt 0 ]]; then
		echo "$(tput setaf 1)! Каталог пуст, отсутствуют варианты для перехода.$(tput setaf 7)"
		echo
	    else
		read inputdirectory
			if [ !  -d $inputdirectory ]; then
			    echo "$(tput setaf 1)Каталог не существует$(tput setaf 7)"
			    echo
			else
			    cdto $inputdirectory
			    echo "$(tput setaf 2)Теперь вы в каталоге $PWD $(tput setaf 7)"
			    echo
			fi
	    fi
    else
	echo "Неверный ввод, попробуйте ещё раз."
    fi
done
exit
