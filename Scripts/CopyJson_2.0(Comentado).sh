#!/bin/bash

function pause(){
	read -p "$*"
}


# Variables
usuario_servidor="gio" # Reemplaza "usuario" con el nombre de usuario que utilizas para conectarte al servidor
servidor="10.19.17.125" # Reemplaza "servidor" con la dirección IP o el nombre de dominio del servidor
ruta_archivo_servidor="/home/gio/Foxconn/Json_Master/Zwave_09/Powerg_81.18/json_sku.txt" # Reemplaza "/ruta/al/archivo.txt" con la ruta del archivo en el servidor que deseas copiar
ruta_destino_pc="C:\Users\miguelmacias\Desktop\Json_Sku\Zwave09\Powerg81.18" # Reemplaza "/ruta/en/tu/pc/" con la ruta en tu PC Windows donde deseas guardar el archivo
ruta_archivo_password="C:\Users\miguelmacias\Desktop\Json_Sku\password.txt" # Reemplaza "/ruta/al/archivo/password.txt" con la ruta del archivo que contiene la contraseña del usuario del servidor

# Conexión al servidor y copia del archivo
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
