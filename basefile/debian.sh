#!/bin/bash
# creates a basefile for Debian (as I won't trust others).
# Be sure to edit yeri/debian to whatever you please.
debootstrap wheezy wheezy
PID=$(tar -C wheezy/ -c . | docker import - wheezy)
docker tag $PID yeri/debian
docker push yeri/debian
docker rmi wheezy
docker rmi yeri/debian
rm -rf wheezy
