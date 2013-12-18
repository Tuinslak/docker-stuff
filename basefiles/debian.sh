#!/bin/bash
# change path; might give problems if you don't change this and when you use cron
cd /home/docker/debian/

# bootstrap
/usr/sbin/debootstradebootstrap wheezy wheezy
PID=$(tar -C wheezy/ -c . | docker import - wheezy)

# docker stuff
# be sure to edit yeri/debian to your repo
docker tag $PID yeri/debian
docker push yeri/debian
docker rmi wheezy
docker rmi yeri/debian
rm -rf wheezy
