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

ComGit=$(which git | awk '{print $2 $3}')
ComCurl=$(which curl | awk '{print $2 $3}')
ComJQ=$(which jq | awk '{print $2 $3}')

estado=$(curl -s $url --head | grep 200 | awk '{print $2}' | head -1)
Nregistro=$(curl -s $url | jq -r '.sellers[] | "Name: \(.name) - Domain: \(.domain)"' | wc | awk '{print $1}')
NregistroFiltrada=$(curl -s $url | jq -r '.sellers[] | "Name: \(.name) - Domain: \(.domain)"' | grep "$2" | wc | awk '{print $1}')

echo -e "\n${CVerde}[+]${CFin} ${CBlanco}La url: $1${CFin}"
echo -e "-----------------------------------"

if [[ "$estado" == "200" ]]
then
	if [ $arg >1 ]
	then
		echo -e "${CTurquesa}[+]${CFin} ${CTurquesa}Filtro activo: \t $2 ${CFin}"
		echo -e "${CTurquesa}[+]${CFin} ${CTurquesa}Nº de registros: \t $NregistroFiltrada ${CFin}"
		echo -e "-----------------------------------"
		curl -s $url | jq -r '.sellers[] | "\(.name) \t \(.domain) \t \(.seller_type)"' | grep "$2" | column -t -N Nombre:,Dominios:,Tipo: -s $'\t'
	else
		echo -e "${CTurquesa}[+]${CFin} ${CTurquesa}Nº de registros: \t $Nregistro ${CFin}"
		echo -e "-----------------------------------"
		curl -s $url | jq -r '.sellers[] | "\(.name) \t \(.domain)"' | column -t -N Nombre:,Dominios: -s $'\t'
	fi
else
	echo -e "${CRojo}[+] La url pasada no dispone de archivo sellers.Json${CFin}\n"
fi