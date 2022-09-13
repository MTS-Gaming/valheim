#!/bin/bash

#Copy 64bit steamclient, since it keeps using 32bit
#cp /home/steam/steamcmd/linux64/steamclient.so /home/steam/valheim/server/

#Apply default values for server if not set
VALHEIM_NAME="valheim"
VALHEIM_PORT="2456"
VALHEIM_WORLD="valheim"
VALHEIM_PASSWORD="beergood"
VALHEIM_PUBLIC="1"

#Launch server
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970
/home/steam/valheim/server/valheim_server.x86_64 -name "$VALHEIM_NAME" -port $VALHEIM_PORT -world "$VALHEIM_WORLD" -password "$VALHEIM_PASSWORD" -savedir "/home/steam/valheim/data" -public $VALHEIM_PUBLIC &

#Trap Container Stop for graceful exit
trap "kill -SIGINT $!;" SIGTERM

#Wait for server to exit
while wait $!; [ $? != 0 ]; do true; done
