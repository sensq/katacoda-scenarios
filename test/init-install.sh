#!/bin/bash

# Configure Prompt
echo "export PS1=\"[\u@\h \w]\$ \"" > /etc/profile.d/init-env.sh

# Generate SSH Key
ssh-keygen -t rsa -N "" -f ~/.ssh/test_key
# Configure ssh-config
cp -fp /configs/ssh_config ~/.ssh/config

# Install Ansible and utils
yum install -y jq ansible ansible-lint yamllint
# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
