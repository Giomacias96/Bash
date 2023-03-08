#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


powerg() {
    powergv4_fw=`adb shell getprop | grep powergv4.fw`
    echo "Version PowergV4: ${green}${powergv4_fw}"
    if [[ $powergv4_fw == *"[81.18]"* ]]; then
        echo "Firmware Powerg Correcto/Normal. ${green}${powergv4_fw}"
    else
        echo "${red} Firmware Powerg con version 82.08. Hablar con TE. ${red}${powergv4_fw}"
    fi
    powerg_running=`adb shell getprop | grep init.svc.powergd`
    if [[ $powerg_running == *"running"* ]]; then
        echo "${green}Servicio Powerg ${green}Corriendo"
    else
        echo "${red}Servicio Powerg ${red}apagada"
    fi
}

srf() {
    srf=`adb shell getprop | grep srfslot.matrix`
    if [[ $srf == *"[0000]"* ]]; then
        echo "${red}SRF ${red}no esta presente"
    else
        echo "${green}SRF ${green}presente"
    fi
    srf_svc=`adb shell getprop | grep svc.srfd`
    if [[ $srf_svc == *"running"* ]]; then
        echo "${green} Servicio SRF corriendo"
    else
        echo "${red} Servicio SRF apagado"
    fi
}

zwave() {
    zwave=`adb shell getprop | grep zwave.slot`
    if [[ $zwave == *"[4]"* ]]; then
        echo "${green}ZWAVE ${green}presente"
    else
        echo "${red}ZWAVE ${red}no esta presente"
    fi
    zwave2=`adb shell getprop | grep zwave.frequency]`
    if [[ $zwave2 == *"[09]"* ]]; then
        echo "${green} Servicio ZWAVE corriendo"
    elif [[ $zwave2 == *"[01]"* ]]; then
        echo "${red} Servicio ZWAVE corriendo, pero con zwave.frequency = [01]"
	echo "${red} Acercarse con TE, para resolver problema."
    else
        echo "${red} Servicio ZWAVE apagado. Necesita correr por estacion MMI."
    fi
}

mb() {
    image_version=`adb shell getprop | grep ro.build.date]`
    echo "MB: ${green}${image_version}"
}

lcd() {
    lcd_version=`adb shell "cat /sys/bus/i2c/devices/3-0038/fts_fw_version"`
    
    if [[ $lcd_version == *"02"* ]]; then
        echo "${reset}LCD: King Display"
    elif [[ $lcd_version == *"04"* ]]; then
        echo "${reset}LCD: Hanstar"
    else
        echo "Version LCD ${red}Desconocida"
    fi
}

print_info() {
    powerg
    srf
    zwave
    mb
    # lcd	
}



mmi() {
    pm package
}

print_info
read -p "Presiona una tecla..." -n1 -s
