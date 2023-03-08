#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

while :
do
    sleep 4
    clear
    device=`adb devices | grep -v 'a027bc7b' |grep -v 'List'| awk '{ print $1 }'`
    srf=$(adb -s $device shell "getprop | grep qolsys.srf_slot_three.fw")
    
    if [[ $srf == *"11.2.2"* ]]; then
	echo "11.2.2"
    elif [[ $srf == *"11.2.1"* ]]; then
	echo "11.2.1"
    else
echo $srf
	echo "NO SRF"
    fi   
done
