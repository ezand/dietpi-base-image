#!/bin/bash

# Install common packages
apt-get --assume-yes install curl

# Install Docker
curl -sSL https://get.docker.com | sh
usermod -aG docker dietpi

# Install Docker Compose
apt-get --assume-yes install docker-compose

# Setup Docker Compose
mkdir -p /opt/docker-compose/services
cd /opt/docker-compose
curl -fsSL https://raw.githubusercontent.com/ezand/dietpi-base-image/master/docker-compose/docker-compose.service --output docker-compose.service
curl -fsSL https://raw.githubusercontent.com/ezand/dietpi-base-image/master/docker-compose/docker-compose.yml --output docker-compose.yml
systemctl enable /opt/docker-compose/docker-compose.service
docker-compose build
systemctl start docker-compose
