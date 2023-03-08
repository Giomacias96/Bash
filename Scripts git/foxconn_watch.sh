#!/bin/bash
declare -a running_devices

while :
do
    sleep 1
    present_devices=$(fastboot devices | awk '{ print $1; }')
    for device in "${present_devices[@]}"; do
        if [[ -z "${device}" ]]; then
            continue;
        fi
        if [[ ! " ${running_devices} " =~ " ${device} " ]]; then
            echo "MB no flasheada ${device}. Flasheando..."
            ./git-bash foxconn_flash.sh $device &
            running_devices+=($device)
        fi
    done
done
