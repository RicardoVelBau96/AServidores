#!/bin/bash

user=$(whoami)
echo -e "Archivos y directorios que puedes recuperar \n"
ls -1 /home/$user/.local/share/Trash/files/


echo -e "\nIngresa el nombre del que desea recuperar \n"

read recuperar 

echo -e "\nIngrese la ruta a donde quiere recuperar el archivo\n"

read ruta

mv /home/$user/.local/share/Trash/files/$recuperar $ruta

echo -e "\nSe ha recuperado\n"
