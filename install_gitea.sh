#!/bin/bash

echo "##### Install Gitea"
echo "##### Copy docker-compose.yml from host and up it"
cp /vagrant/docker-compose.yml .
docker-compose up -d