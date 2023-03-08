#!/bin/bash

echo "Flasheando $1"
    # rem fastboot flash modem NON-HLOS.bin
    # rem fastboot flash modem NON-HLOS-ATT.bin
    # rem fastboot flash fsg NEW_ATT_FSG.img
    fastboot -s $1 flash aboot emmc_appsboot.mbn

    fastboot -s $1 flash boot boot.img

    fastboot -s $1 flash system system.img

    fastboot -s $1 flash userdata userdata.img

    fastboot -s $1 flash persist persist.img

    fastboot -s $1 flash recovery recovery.img

    fastboot -s $1 flash cache cache.img

    fastboot -s $1 format userdata

    # rem fastboot flash fsg fs_image.tar.gz.mbn.img

    #ECHO Image Download have finished
    echo "System is now rebooting!"
    fastboot -s $1 reboot