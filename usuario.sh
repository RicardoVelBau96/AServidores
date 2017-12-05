#!/bin/bash
echo -e "Ingresa el nombre del usuario\n"
read usuario

echo -e "\nIngresa un comentario para el usuario\n"
read comentario

echo -e "\nEstos son los grupos que hay\n"
cat /etc/group

echo -e "\nIngresa el nombre del grupo para el usuario\n"
read grupo
sudo groupadd $grupo

echo -e "\nIngrese la ruta del directorio hogar (Por default es: /home/'nombreUsuario'\n"
read dirHogar

sudo useradd -c $comentario -d $dirHogar -m -k /etc/skel -g $grupo -s /bin/bash $usuario

echo -e "\nSE HA CREADO EL USUARIO\n"
sleep 3

echo -n "Se modificara la contraseña del usuario: "$usuario
sleep 3
echo -e "\nIngrese la contraseña del usuario"
echo -e "debe ser de 8 caracteres, 2 mayusculas y 1 numero\n"
STTY_SAVE=`stty -g`
stty -echo
read contra
stty $STTY_SAVE
longitud=${#contra}
					 if [ $longitud = 8 ];
					then 
echo -e "\nCumple la condicion\n"
echo "$usuario:$contra" | sudo chpasswd
					else
					echo -e "\nNo cumple la condicion\n"
					fi

echo -e "CONTRASEÑA DEFINIDA"
sleep 2
echo -e "SCRIPT FINALIZADO\n"
