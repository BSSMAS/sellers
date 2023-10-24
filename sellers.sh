#!/bin/bash

function sellers() {

arg=$#
url="https://"$1"//sellers.json"

echo -e "\n[+] La url a filtrar es: $1"
echo -e "-----------------------------------\n"

if ($arg >1)
then
	curl -s $url | awk -F'[:,]' '/"name"/{name=$4; gsub("\"", "", name)} /"domain"/{domain=$6; gsub("\"", "", domain); print "Name: " name " - Domain: " domain}' | grep "$2"
else
	curl -s $url | awk -F'[:,]' '/"name"/{name=$4; gsub("\"", "", name)} /"domain"/{domain=$6; gsub("\"", "", domain); print "Name: " name " - Domain: " domain}'
fi

}