#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

while :
do
    sleep 2
    clear
    power_g=$(adb shell "getprop | grep powerg")
    if [[ $power_g == *"[82.08]"* ]]; then
	echo "${green}OK"
    else
	echo "${red}NO POWERG"
    fi   
done
