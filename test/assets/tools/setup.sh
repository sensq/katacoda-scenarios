#!/bin/bash

# Wait init-install.sh completed
sleep 10

# Up sshd-containers(=Pseudo target server)
cd /tools
echo "PUBLIC_KEY=\"$(cat ~/.ssh/test_key.pub)\"" > .env
docker-compose up -d
docker-compose exec target-server-01 sudo bash /init-container.sh &
docker-compose exec target-server-02 sudo bash /init-container.sh &
docker-compose exec target-server-03 sudo bash /init-container.sh

clear
