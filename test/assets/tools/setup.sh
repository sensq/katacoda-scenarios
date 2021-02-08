#!/bin/bash

# Up sshd-containers(=Pseudo target server)
cd ~/tools
echo "PUBLIC_KEY=\"$(cat ~/.ssh/test_key.pub)\"" > .env
docker-compose up -d
docker-compose exec target-server-01 sudo apk add python3
docker-compose exec target-server-02 sudo apk add python3
