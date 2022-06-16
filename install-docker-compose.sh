#!/bin/bash

echo "##### Installing docker compose 1.29.2..."
#curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose && chmod +x /tmp/docker-compose && sudo cp /tmp/docker-compose /usr/local/bin/docker-compose

echo "##### Downloading the binary..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo "##### Make it executable..."
sudo chmod +x /usr/local/bin/docker-compose

echo "##### Checking docker-compose installed version..."
docker-compose version








