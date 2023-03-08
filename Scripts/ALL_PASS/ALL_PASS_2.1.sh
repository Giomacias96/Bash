# El script tiene las siguientes funciones:

# Utiliza el comando adb devices para obtener la lista de dispositivos conectados al ordenador a través de ADB (Android Debug Bridge).

# Filtra la lista de dispositivos para eliminar cualquier dispositivo que tenga el número de serie "iddevice".

# Utiliza el comando awk para imprimir el primer campo (que es el número de serie del dispositivo) de la lista de dispositivos filtrada.

# Utiliza el comando adb -s para ejecutar comandos en el dispositivo especificado por su número de serie. 

# Utiliza el comando getprop para obtener la versión de "powergv4.fw" y "zwave.frequency" del dispositivo.

# Compara la versión de "powergv4.fw" y "zwave.frequency" del dispositivo con varios patrones utilizando if y [[ ]]. 

# Si se cumplen ciertas condiciones, cambia el directorio a una ruta específica y ejecuta un archivo .jar utilizando java.

# Finalmente, el script duerme durante 10 segundos antes de finalizar.




case "$zwave_version-$powerg_version" in
  *"09-81.18"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-09";;
  *"09-82.08"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-09/Lucy_L10_MMI_2.4.0-82.08";;
  *"01-81.18"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-01";;
  *"01-82.08"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-01/Lucy_L10_MMI_2.4.0-82.08";;
  *"09-83.02"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-83.02";;
  *"01-83.02"*) dir="C:/Programs/Lucy_L10_MMI_2.4.0-83.02/Lucy_L10_MMI_2.4.0-01";;
  *) dir="C:/Programs/Lucy_L10_MMI_2.4.0-09";;
esac
if [[ -n $dir ]]; then
  cd "$dir"
  java -jar MP_IQ4_IQ4Hub_IQ4NS_L10MMI_2.4.0.jar
fi
