#!/bin/bash

function sellers() {

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
url="https://"$1"//sellers.json"

echo -e "\n${CVerde}[+]${CFin} ${CBlanco}La url a filtrar es: $1${CFin}"
echo -e "-----------------------------------\n"

if [ $arg >1 ]
then
	curl -s $url | awk -F'[:,]' '/"name"/{name=$4; gsub("\"", "", name)} /"domain"/{domain=$6; gsub("\"", "", domain); print "Name: " name " - Domain: " domain}' | grep "$2"
else
	curl -s $url | awk -F'[:,]' '/"name"/{name=$4; gsub("\"", "", name)} /"domain"/{domain=$6; gsub("\"", "", domain); print "Name: " name " - Domain: " domain}'
fi

}