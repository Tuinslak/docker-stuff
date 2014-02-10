#!/bin/bash
export DOCKER_HOST=tcp://

wget https://raw.github.com/steeve/boot2docker/master/boot2docker -O /usr/local/bin/boot2docker
chmod +x /usr/local/bin/boot2docker
wget http://get.docker.io/builds/Darwin/x86_64/docker-latest -O /usr/local/bin/docker
chmod +x /usr/local/bin/docker
