#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

log_file=/sdcard/L10MMI_testResult/

while :
do
    sleep 1
    clear
    java -jar MP |
    while IFS= read -r line
    do
      echo "$line" | grep "/C curl -X POST" | sed 's/SSN=\(\.+&$)\.+TestResult=\(\.+&$)/\1 \2'
    done
done
