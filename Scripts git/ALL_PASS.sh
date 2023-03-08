#!/bin/bash

device=`adb devices | grep -v 'aa888d1f' |grep -v 'List'| awk '{ print $1 }'`
powerg_version=$(adb -s $device shell "getprop | grep powergv4.fw")
zwave_version=$(adb -s $device shell "getprop | grep zwave.frequency")
if [[ $zwave_version == *"09"* && $powerg_version == *"81.18"* ]];then
  cd C:/Programs/Lucy_L10_MMI_2.4.0-09
  java -jar MP_IQ4_IQ4Hub_IQ4NS_L10MMI_2.4.0.jar
fi
if [[ $zwave_version == *"09"* && $powerg_version == *"82.08"* ]];then
    cd C:/Programs/Lucy_L10_MMI_2.4.0-09/Lucy_L10_MMI_2.4.0-82.08
    java -jar MP_IQ4_IQ4Hub_IQ4NS_L10MMI_2.4.0.jar
fi
if [[ $zwave_version == *"01"* && $powerg_version == *"81.18"* ]];then
  cd C:/Programs/Lucy_L10_MMI_2.4.0-01
  java -jar MP_IQ4_IQ4Hub_IQ4NS_L10MMI_2.4.0.jar
fi
if [[ $zwave_version == *"01"* && $powerg_version == *"82.08"* ]];then
  cd C:/Programs/Lucy_L10_MMI_2.4.0-01/Lucy_L10_MMI_2.4.0-82.08
  java -jar MP_IQ4_IQ4Hub_IQ4NS_L10MMI_2.4.0.jar
fi
sleep 10