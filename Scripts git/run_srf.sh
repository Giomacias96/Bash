#!/bin/bash

device=`adb devices | grep -v 'b2ad6ba' |grep -v 'List'| awk '{ print $1 }'`
srf_version=$(adb -s $device shell "getprop | grep srf_slot_three.fw]")
if [[ $srf_version == *"11.2.1-H26"* ]];then
  cd C:\Programs\Lucy_L10_MMI-MP_Gen4_L10MMI_1.1.11
  java -jar MP_Gen4_L10MMI_1.1.11.jar
fi
if [[ $srf_version == *"11.2.2-H26"* ]];then
  cd C:\Users\qolsysadmin\Desktop\Lucy_L10_MMI-MP_Gen4_L10MMI_1.1.11
  java -jar MP_Gen4_L10MMI_1.1.11.jar
fi
sleep 10