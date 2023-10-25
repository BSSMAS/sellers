#!/bin/bash

#Colores
CNegro="\e[0;30m\033[1m"
CRojo="\e[0;31m\033[1m"
CVerde="\e[0;32m\033[1m"
CAmarillo="\e[0;33m\033[1m"
CAzul="\e[0;34m\033[1m"
CMorado="\e[0;35m\033[1m"
CTurquesa="\e[0;36m\033[1m"
CBlanco="\e[0;37m\033[1m"
CFin="\033[0m\e[0m"

arg=$#
url="https://"$1"/sellers.json"
ComGit=$(which git)
ComCurl=$(which curl)
ComJQ=$(which jq)

estado=$(curl -s $url --head | grep 200 | awk '{print $2}')
Nregistro=$(curl -s $url | jq -r '.sellers[] | "Name: \(.name) - Domain: \(.domain)"' | wc | awk '{print $1}')
NregistroFiltrada=$(curl -s $url | jq -r '.sellers[] | "Name: \(.name) - Domain: \(.domain)"' | grep "$2" | wc | awk '{print $1}')

echo -e "\n${CVerde}[+]${CFin} ${CBlanco}La url: $1${CFin}"
echo -e "-----------------------------------"

if [[ "$estado" == "200" ]]
then
	if [ $arg >1 ]
	then
		echo -e "${CTurquesa}[+]${CFin} ${CTurquesa}Filtro activo: \t $2 ${CFin}"
		echo -e "${CTurquesa}[+]${CFin} ${CTurquesa}Nº de registros: \t $NregistroFiltrada ${CFin} \n"
		curl -s $url | jq -r '.sellers[] | "Name: \(.name) - Domain: \(.domain)"' | grep "$2"
	else
		echo -e "${CTurquesa}[+]${CFin} ${CTurquesa}Nº de registros: \t $Nregistro ${CFin} \n"
		curl -s $url | jq -r '.sellers[] | "Name: \(.name) - Domain: \(.domain)"'
	fi
else
	echo -e "${CRojo}[+] La url pasada no dispone de archivo sellers.Json${CFin}\n"
fi
