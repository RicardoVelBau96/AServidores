#! /bin/bash

while :
do 
echo " De que manera quiere configurar la interfaz"
echo "[1] Cableada"
echo "[2] Inalambrica"
echo "[3] Salir"
echo "Ingresa el numero de la opción: "
read opcion
case $opcion in

1) echo "ELIGIO LA CABLEADA, SELECCIONA UNA OPCION";
echo "[1] Estática"
echo "[2] Dinámica"
echo "Ingresa la opción: " 
read opcion
case $opcion in

1) echo "Elegiste Estática: "

echo -e "\nEstas son las interfaces de red"
sudo ifconfig
sleep 10

echo -e "\n¿Que interfaz vas a configurar?"
read interfaz
echo -e "\nIngresa la ip"
read ip
echo -e "\nIngresa la mascara"
read mascara

sudo ifconfig $interfaz $ip netmask $mascara up
echo -e "\nConfiguracion Correcta"

echo -e "\nAhora ingresa la ip del gateway: "
read gw
route add default gw $gw

;;

2) echo "Eligiste Dinámica: "

echo -e "\nEstas son las interfaces de red\n"
sudo ifconfig
sleep 7

echo -e "\n¿Que interfaz vas a configurar?"
read interfaz
sudo dhclient $interfaz

;;

esac
;;

2) echo "ELIGIO LA INALAMBRICA, SELECCIONA UNA OPCION "
echo "[1] Estática"
echo "[2] Dinámica"
echo "Ingresa la opción: " 
read opcion
case $opcion in

1) echo "Eligiste Estática: "

echo -e "\nEstas son las interfaces de red\n"
sudo ifconfig
sleep 10

echo -e "\n¿Que interfaz vas a configurar?"
read interfaz
echo -e "\n*Estas son las redes disponibles*"
sudo iwlist $interfaz scan
echo -e "\nIngresa el ESSID de la red a la que te conectaras"
read essid
echo -e "\nIngresa la contraseña de la red, si es que tiene "
read pass

sudo iwconfig $interfaz essid $essid key s:$pass

echo -e "\nIngresa la ip"
read ip
echo -e "\nIngresa la mascara"
read mascara

sudo ifconfig $interfaz $ip netmask $mascara up
echo -e "\nConfiguracion Correcta"

echo -e "\nAhora ingresa la ip del gateway: "
read gw
route add default gw $gw

;;

2) echo -e "\n Elegiste Dinámica: "
echo -e "\nEstas son las interfaces de red\n"
sudo ifconfig
sleep 7

echo -e "\n¿Que interfaz vas a configurar?"
read interfaz
echo -e "\n*Estas son las redes disponibles*"
sudo iwlist $interfaz scan
echo -e "\nIngresa el ESSID de la red a la que te conectaras "
read essid
echo -e "\nIngresa la contraseña de la red, si es que tiene "
read pass

sudo iwconfig $interfaz essid $essid key s:$pass
sudo dhclient $interfaz

;;

esac
;;

3) echo "Saliendo del Scripts, adios.";
exit 1;;

esac
done
