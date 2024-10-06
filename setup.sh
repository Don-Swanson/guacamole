#!/bin/sh
#
# check if docker is running
if ! (docker ps >/dev/null 2>&1)
then
	echo "docker daemon not running, will exit here!"
	exit
fi
echo "Preparing folder init and creating ./init/initdb.sql"
mkdir ./init >/dev/null 2>&1
chmod -R +x ./init
#Temp add 1.6.0 for latest 1.6.0
docker run --rm donswanson/guacamole:1.6.0 /opt/guacamole/bin/initdb.sh --postgresql > ./init/initdb.sql
