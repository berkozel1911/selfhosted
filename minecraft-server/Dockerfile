FROM debian:stable-slim

RUN apt update && apt install -y tmux default-jdk wget --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ARG PKG="https://piston-data.mojang.com/v1/objects/64bb6d763bed0a9f1d632ec347938594144943ed/server.jar"

RUN wget -O server.jar $PKG
RUN echo "eula=true" > eula.txt

COPY server.properties .
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Secret oluşturma ve dosya düzenleme
RUN RANDOM_SECRET=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 40) && \
    sed -i "s/CHANGE_MGMT_SERVER_SECRET/$RANDOM_SECRET/g" server.properties

RUN chmod +x /usr/local/bin/entrypoint.sh server.jar 

WORKDIR /mc

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
