#!/bin/bash

cd /tools
docker-compose down
docker-compose up -d
docker-compose exec target-server-01 sudo bash /container-files/init-container.sh
docker-compose exec target-server-02 sudo bash /container-files/init-container.sh
docker-compose exec target-server-03 sudo bash /container-files/init-container.sh

rm -f ~/.ssh/known_hosts

clear
