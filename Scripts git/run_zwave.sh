#!/bin/bash

device=`adb devices | grep -v '1af96955' |grep -v 'List'| awk '{ print $1 }'`
zwave_version=$(adb -s $device shell "getprop | grep qolsys.zwave.frequency")
if [[ $zwave_version == *"01"* ]]; then
  cd C:/Programs/Lucy_L10_MMI_2.1.2-01
  java -jar MP_IQ4_IQ4Hub_IQ4NS_L10MMI_2.1.2.jar
fi
if [[ $zwave_version == *"09"* ]]; then
  cd C:/Programs/Lucy_L10_MMI_2.1.2-09
  java -jar MP_IQ4_IQ4Hub_IQ4NS_L10MMI_2.1.2.jar
fi
sleep 10