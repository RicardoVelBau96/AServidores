#!/bin/bash

echo -e "Ingresa la ruta con el nombre del archivo a eliminar\n"

read borrar

user=$(whoami)

mv $borrar /home/$user/.local/share/Trash/files/

echo -e "\nSe ha borrado\n"

