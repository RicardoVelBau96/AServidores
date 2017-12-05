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

echo -e "\n"
echo -e "######################################## "
echo -e "#                                      # "
echo -e "#      ATENCION, LEER CON CUIDADO      # "
echo -e "#                                      # "
echo -e "######################################## "
sleep 5
echo -e "\n"

echo -e "######################################## "
echo -e "#                                      # "
echo -e "#      La asignacion de cuotas         # "
echo -e "#          Debe ser en MB     	       # "
echo -e "#          1024 MB = 1 GB              # "
echo -e "#                                      # "
echo -e "#  Debe ser en el primer SOFT y HARD   # "
echo -e "#      Que aparezca en el archivo      # "
echo -e "#                                      # "
echo -e "#     SOFT debe ser menor que HARD     # "
echo -e "#     O incluso, del mismo tamaño      # "
echo -e "#  PERO NUNCA DEBE SER MAYOR QUE HARD  # "
echo -e "#                                      # "
echo -e "######################################## "
echo -e "#                                      # "
echo -e "#  Al terminar de asignar las cuotas   # "
echo -e "#      Deberas oprimir 'Ctrl+K'        # "
echo -e "#      Y despues 'q' para salir        # "
echo -e "#  Para guardarlo, deberas apretar 'y' # "
echo -e "#                                      # "
echo -e "######################################## "
echo -e "\n"
sleep 20;


sudo edquota -u $usuario

echo -e "\nSE HA ASIGNADO LA CUOTA\n"
sleep 4

echo -e "A CONTINUACION, SE LE PERMITIRA AL USUARIO AGREGAR COMANDOS VIA SUDO\n"

sudo sed -i '$a '$usuario' ALL=(ALL:ALL) ALL' /etc/sudoers
sleep 4
echo -e "\nSE ASIGNO CORRECTAMENTE EN /ETC/SUDOERS\n"


echo -e "\nSCRIPT FINALIZADO\n"
