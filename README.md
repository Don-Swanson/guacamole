[![CircleCI](https://dl.circleci.com/status-badge/img/circleci/XcfWh7FX5QpFKWFb9rXqFw/X2sB6w49MwiCWRpyrpk3vP/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/circleci/XcfWh7FX5QpFKWFb9rXqFw/X2sB6w49MwiCWRpyrpk3vP/tree/main)

# Docker Guacamole
This is a build of the Apache Guacamole Server and Client in multi architecture (I have no idea why they don't build it for other architectures).   

[Apache Guacamole](https://guacamole.apache.org/) is a client-less remote desktop gateway. It supports standard protocols like VNC, RDP, and SSH.
We call it clientless because no plugins or client software are required.
Thanks to HTML5, once Guacamole is installed on a server, all you need to access your desktops is a web browser.

Supported Linux OS: amd64, arm64

These containers are built straight from the Apache source:   
git checkout https://github.com/apache/guacamole-client   
git checkout https://github.com/apache/guacamole-server   

## Startup
See the docer-compose.yml for a sample compose file and below for the options

## Extensions
Extensions can be found here for the current release: https://guacamole.apache.org/releases/ and added to `/opt/guacamole/extensions` of the guacamole client.   
Note, it can be confusing how to do this. One such option is to start the guacamole container, then do a `docker cp guacamole_test:/opt/guacamole/extensions/ ./`, then you can simply copy the jar file from the respective sub folder directly into the extensions folder that you mapped.

**Extension List:**
- auth-duo
- auth-header
- auth-jdbc
- auth-json
- auth-ldap
- auth-quickconnect
- auth-sso
- auth-totp
- vault
- history-recording-storage


## Initial Setup
Run the `setup.sh` script in the directory where you will host the postgres data. It creates `./init/initdb.sql` by downloading the docker image `guacamole/guacamole` and start it like this:

~~~bash
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgresql > ./init/initdb.sql
~~~

It creates the necessary database initialization file for postgres.


## Default User

The default username is `guacadmin` with password `guacadmin`. PLEASE make sure you change it immediately


## License

This will keep the Apache License 2.0 license to make sure we stay in line with Apache Guacamole's license

