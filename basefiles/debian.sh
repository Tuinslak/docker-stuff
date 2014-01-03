#!/bin/bash

# This is what my cron looks like:
#	# m h  dom mon dow   command
#	30 4 * * 3	cd /home/docker/debian/ && su root -c /home/docker/debian/bootstrap.sh >/dev/null 2>&1
# be sure to add the "su root -c" part, or mounting in chroot will fail.

# change path; might give problems if you don't change this and when you use cron
cd /home/docker/debian/

# bootstrap
/usr/sbin/debootstrap wheezy wheezy
PID=$(tar -C wheezy/ -c . | docker import - wheezy)

# docker stuff
# be sure to edit yeri/debian to your repo
docker tag $PID yeri/debian
docker push yeri/debian
docker rmi wheezy
docker rmi yeri/debian
rm -rf wheezy
