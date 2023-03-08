#!/bin/bash

function pause(){
	read -p "$*"
}


# Variables
usuario_servidor="gio" 
servidor="10.19.17.125" 
ruta_archivo_servidor="/home/gio/Foxconn/Json_Master/Zwave_09/Powerg_81.18/json_sku.txt" 
ruta_destino_pc="C:\Users\miguelmacias\Desktop\Json_Sku\Zwave09\Powerg81.18"
ruta_archivo_password="C:\Users\miguelmacias\Desktop\Json_Sku\password.txt"

echo "Conectando al servidor y copiando el archivo..."
scp $usuario_servidor@$servidor:$ruta_archivo_servidor $ruta_destino_pc

# Verificación de la copia
if [ $? -eq 0 ]; then
    echo "Copia exitosa del archivo desde el servidor a tu PC Windows."
else
    echo "Error al copiar el archivo desde el servidor a tu PC Windows."
    echo $usuario_servidor@$servidor:$ruta_archivo_servidor $ruta_destino_pc
fi

pause "Presione Enter para continuar ..."
