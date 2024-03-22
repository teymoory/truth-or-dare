#!/bin/bash

function number_user(){

	while [ -z $numberU ];do

		read -p "Please enter number user of game : " numberU
		numberU=$(echo $numberU | tr -d [:alpha:] | tr -d [:blank:] | tr -d [:punct:])
		if [ "$numberU" = "1" ] || [ "$numberU" = "2" ];then
			unset numberU
		fi
	done
}

function random_user(){
	while [ $random1 -eq $random2 ];do
		random1=$((RANDOM%$numberU+1))
		random2=$((RANDOM%$numberU+1))
	done

}

function input_user(){

	for (( i=1 ; i <= $numberU ; i++ ));do

		read -p "Please enter username gamers : " inputU[$i]
		if [ -z ${inputU[$i]} ];then
			echo "This empty ! Try again !" | lolcat
			((i--))
		fi

	done
}

while [ "$again" != "exit" ];do

	number_user
	input_user
	random_user
	echo "Asking UserName : ${inputU[$random1]} => UserName : ${inputU[$random2]}"

	read -p "Again? or exit? : " again
	unset random1
	unset random2
	unset numberU
	unset inputU[@]
done
