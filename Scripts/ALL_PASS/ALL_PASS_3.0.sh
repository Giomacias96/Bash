#!/bin/bash

device=`adb devices | grep -v 'b2ad6ba' |grep -v 'List'| awk '{ print $1 }'`
powerg_version=$(adb -s $device shell "getprop | grep powergv4.fw")
zwave_version=$(adb -s $device shell "getprop | grep zwave.frequency")
case "$zwave_version-$powerg_version" in
  *"09-81.18"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-09";;
  *"09-82.08"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-09/Lucy_L10_MMI_2.4.0-82.08";;
  *"01-81.18"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-01";;
  *"01-82.08"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-01/Lucy_L10_MMI_2.4.0-82.08";;
  *"09-83.02"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-83.02";;
  *"01-83.02"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-83.02/Lucy_L10_MMI_2.4.0-01";;
  #*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-09";;
esac
if [[ -n $dir ]]; then
  cd "$dir"
  java -jar MP_IQ4_IQ4Hub_IQ4NS_L10MMI_2.4.0.jar
fi
sleep 10



