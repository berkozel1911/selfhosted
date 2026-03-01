#!/bin/bash

if [ ! -f "/mc/server.jar" ]; then
    cp -r /app/. /mc/
fi

cd /mc

touch /mc/server.log

tmux new-session -d -s mc "java -Djava.net.preferIPv6Addresses=true -Xmx4G -Xms4G -jar server.jar nogui | tee -a server.log"

tail -f /mc/server.log
