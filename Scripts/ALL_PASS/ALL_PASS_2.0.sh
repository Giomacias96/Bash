#!/bin/bash

device=`adb devices | grep -v 'b2ad6ba' |grep -v 'List'| awk '{ print $1 }'`
powerg_version=$(adb -s $device shell "getprop | grep powergv4.fw")
zwave_version=$(adb -s $device shell "getprop | grep zwave.frequency")
program_dir="C:/Programs"
jar_file="MP_IQ4_IQ4Hub_IQ4NS_L10MMI_2.4.0.jar" # Variables para almacenar las rutas y el nombre del archivo .jar.
case "$zwave_version-$powerg_version" in
  "09-81.18")
    cd "$program_dir/Lucy_L10_MMI_2.4.0-09"
    java -jar "$jar_file"
    ;;
  "09-82.08")
    cd "$program_dir/Lucy_L10_MMI_2.4.0-09/Lucy_L10_MMI_2.4.0-82.08"
    java -jar "$jar_file"
    ;;
  "01-81.18")
    cd "$program_dir/Lucy_L10_MMI_2.4.0-01"
    java -jar "$jar_file"
    ;;
  "01-82.08")
    cd "$program_dir/Lucy_L10_MMI_2.4.0-01/Lucy_L10_MMI_2.4.0-82.08"
    java -jar "$jar_file"
    ;;
  "09-83.02")
    cd "$program_dir/Lucy_L10_MMI_2.4.0-83.02"
    java -jar "$jar_file"
    ;; # Codigo de comparacion con estructura case
esac
sleep 10



