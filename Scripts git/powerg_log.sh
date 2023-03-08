#!/bin/bash

device=`adb devices | grep -v '725f8bc' |grep -v 'List'| awk '{ print $1 }'`
adb -s $device logcat -v time -s powergservice powerghal powerghal_data /system.bin/powergvirtualmodem > powerg.log