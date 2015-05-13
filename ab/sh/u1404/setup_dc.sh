#!/bin/bash
# setup docker
#
echo 'DOCKER_OPTS="--bip=172.17.42.1/24 --dns 172.17.42.1 --dns 8.8.8.8 --dns 8.8.4.4"' | sudo tee /etc/default/docker -a
#
# install docker-compose
#
sudo apt-get install -yq python-pip git
sudo pip install -U docker-compose
