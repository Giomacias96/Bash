#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

while :
do
    sleep 4
    clear
    zwave=$(adb shell "getprop | grep qolsys.zwave.frequency")
    
    if [[ $zwave == *"01"* ]]; then
	echo "[01]"
    elif [[ $zwave == *"09"* ]]; then
	echo "[09]"
    else
echo $zwave
	echo "NO ZWAVE"
    fi   
done
