#!/bin/bash



while :
do
    read -rsn1 -p "Presiona una tecla para correr el comando";echo
    adb devices
    adb shell service call qutilservice 46 i32 1
done