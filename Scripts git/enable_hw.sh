#!/bin/bash

device=`adb devices | grep -v '1af96955' |grep -v 'List'| awk '{ print $1 }'`
adb -s $device shell setprop qolsys.factory.hwd 1