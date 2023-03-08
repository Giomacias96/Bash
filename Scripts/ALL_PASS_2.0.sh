#!/bin/bash

device=`adb devices | grep -v 'aa888d1f' |grep -v 'List'| awk '{ print $1 }'`
zwave_version=$(adb -s $device shell "getprop | grep zwave.frequency")
powerg_version=$(adb -s $device shell "getprop | grep powergv4.fw")
case "$zwave_version" in
   *"09"*)
      case "$powerg_version" in
         *"81.18"*)
            dir="C:/Programs/Lucy_L10_MMI_2.4.0-09"
            ;;
         *"82.08"*)
            dir="C:/Programs/Lucy_L10_MMI_2.4.0-09/Lucy_L10_MMI_2.4.0-82.08"
            ;;
         *"83.02"*)
            dir="C:/Programs/Lucy_L10_MMI_2.4.0-83.02"
            ;;
         *)
            dir="C:/Programs/Lucy_L10_MMI_2.4.0-09"
            ;;
      esac
      ;;
   *"01"*)
      case "$powerg_version" in
         *"81.18"*)
            dir="C:/Programs/Lucy_L10_MMI_2.4.0-01"
            ;;
         *"82.08"*)
            dir="C:/Programs/Lucy_L10_MMI_2.4.0-01/Lucy_L10_MMI_2.4.0-82.08"
            ;;
         *"83.02"*)
            dir="C:/Programs/Lucy_L10_MMI_2.4.0-83.02/Lucy_L10_MMI_2.4.0-01"
            ;;
         *)
            dir="C:/Programs/Lucy_L10_MMI_2.4.0-01"
            ;;
      esac
      ;;
   *)
      case "$powerg_version" in
         *"81.18"*)
            dir="C:/Programs/Lucy_L10_MMI_2.4.0-01"
            ;;
         *"82.08"*)
            dir="C:/Programs/Lucy_L10_MMI_2.4.0-01/Lucy_L10_MMI_2.4.0-82.08"
            ;;
      esac
esac
if [[ -n $dir ]]; then
   cd "$dir"
   java -jar MP_IQ4_IQ4Hub_IQ4NS_L10MMI_2.4.0.jar
fi
sleep 10