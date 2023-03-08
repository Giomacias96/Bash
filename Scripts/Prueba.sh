#!/bin/bash

function pause(){
	read -p "$*"
}


function setprop(){
	while [ $cont -lt 2 ]
  do
    $setprop
    cont=$((cont+1))
  done
}

device=`adb devices | grep -v 'aa888d1f' |grep -v 'List'| awk '{ print $1 }'`
zwave_version=$(adb -s $device shell "getprop | grep zwave.frequency")
powerg_version=$(adb -s $device shell "getprop | grep powergv4.fw")
while [ -z "$zwave_version" ];do
   echo "La variable esta vacia"
   case "$powerg_version" in
      *"81.18"*)
         dir="C:/Programs/Lucy_L10_MMI_2.4.0-01"
         ;;
      *"82.08"*)
         dir="C:/Programs/Lucy_L10_MMI_2.4.0-01/Lucy_L10_MMI_2.4.0-82.08"
         ;;
   esac
done
echo "La variable tiene un valor"
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
esac
if [[ -n $dir ]]; then
   cd "$dir"
   java -jar MP_IQ4_IQ4Hub_IQ4NS_L10MMI_2.4.0.jar
fi
sleep 10

pause "Presione Enter para continuar ..."







if [ -z "$zwave_version" ]; then
   echo "La variable está vacía"
else
   echo "La variable tiene un valor"
fi

pause "Presione Enter para continuar ..."


#Aquí, la opción -z del comando [ (también conocido como test) 
#verifica si la longitud de la cadena de la variable es cero
#, lo que significa que la variable está vacía.


while [ -z "$zwave_version" ];do
   echo "La variable esta vacia"
   while :
   do
      adb -s $device shell setprop qolsys.factory.hwd 1
   done
done