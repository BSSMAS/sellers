# sellers

# RESULTADOS:
# ---------------------------

# MOSTRAMOS LOS DATOS BRUTOS EL ALRCHIVO SELLERS.JSON
# ----------------------------------------------------
curl -s https://www.xxxxxx/sellers.json | awk -F'[:,]' '/"name"/{name=$4; gsub("\"", "", name)} /"domain"/{domain=$6; gsub("\"", "", domain); print "Name: " name " - Domain: " domain}'


# FILTRAMOS LOS DATOS PARA MOSTRAR SOLO LO QUE NOS INTERESA
# ----------------------------------------------------------
curl -s https://www.xxxx/sellers.json | awk -F'[:,]' '/"name"/{name=$4; gsub("\"", "", name)} /"domain"/{domain=$6; gsub("\"", "", domain); print "Name: " name " - Domain: " domain}' | grep BAB 


# FILTRAMOS LOS DATOS Y MOSTRAMOS EL Nº DE REGISTROS DATOS
# ---------------------------------------------------------
curl -s https://www.xxxxx/sellers.json | awk -F'[:,]' '/"name"/{name=$4; gsub("\"", "", name)} /"domain"/{domain=$6; gsub("\"", "", domain); print "Name: " name " - Domain: " domain}' | grep BAB | wc | awk '{print $1}'
