#!/bin/bash

# Install Ansible and utils
yum install -y jq ansible ansible-lint yamllint
# Install Docker
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io
# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Generate SSH Key
ssh-keygen -t rsa -N "" -f ~/.ssh/test_key
export PUBLIC_KEY=$(cat ~/.ssh/test_key.pub)
docker-compose up -d -f ~/tools/docker-compose.yaml

# Configure Prompt
export PS1="[\u@\h \w]\$ "

cd ~
