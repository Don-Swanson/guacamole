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
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgresql > ./init/initdb.sql
mkdir ./extensions >/dev/null 2>&1
docker create --name guac_extensions donswanson/guacamole:latest
docker cp guac_extensions:/opt/guacamole/extensions/ ./extensions_available
docker rm -f guac_extensions
cp ./extensions_available/extensions/guacamole-auth-jdbc-postgresql.jar ./extensions
mkdir ./lib >/dev/null 2>&1
curl -SLo ./postgresql-jdbc.jar "https://jdbc.postgresql.org/download/postgresql-42.7.3.jar"
echo "done"