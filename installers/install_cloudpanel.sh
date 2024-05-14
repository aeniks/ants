#!/bin/bash
echo -e "\n\n\t Installing Cloudpanel... \n \n "
read -t11 -ep "    must run clpinstaller as sudo..." "kkkk";
####
apt update && apt -y upgrade && apt -y install curl wget sudo;
####

curl -sS https://installer.cloudpanel.io/ce/v2/install.sh -o install.sh; \
echo "85762db0edc00ce19a2cd5496d1627903e6198ad850bbbdefb2ceaa46bd20cbd install.sh" | \
sha256sum -c && sudo DB_ENGINE=MARIADB_10.11 bash install.sh;

