adb remount

adb push PowerGFW/PGH_ECOSys_02_011_Oper_915Mhz.hex /sdcard/
adb push PowerGFW/PGH_ECOSys_02_011_Default_915Mhz.hex /sdcard/
adb push PowerGFW/libpowergbootload.so /system/lib/
adb push PowerGFW/pgfactoryupdater /system/bin/


adb shell  pgfactoryupdater /sdcard/PGH_ECOSys_02_011_Default_915Mhz.hex /sdcard/PGH_ECOSys_02_011_Oper_915Mhz.hex 2.11 /dev/ttyHSL1

pause

adb shell getprop | grep powerg

pause