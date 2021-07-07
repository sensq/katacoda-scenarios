#!/bin/bash

# Up sshd-containers(=Pseudo target server)
cd /tools
docker-compose up -d
docker-compose exec target-server-01 sudo bash /container-files/init-container.sh
docker-compose exec target-server-02 sudo bash /container-files/init-container.sh
docker-compose exec target-server-03 sudo bash /container-files/init-container.sh

clear
