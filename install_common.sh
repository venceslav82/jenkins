#!/bin/bash

echo "##### Update repositories and install common packages"
apt-get update
apt-get install -y ca-certificates curl gnupg lsb-release fontconfig nano openjdk-11-jre git