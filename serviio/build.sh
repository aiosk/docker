#!/bin/sh
set -e

if [ ! -f ./serviio-1.6.1-linux.tar.gz ]; then
	curl -Lk -o ./serviio-1.6.1-linux.tar.gz http://download.serviio.org/releases/serviio-1.6.1-linux.tar.gz
fi

../replace-for-arm.sh \
&& cp ../lib.sh ./lib.sh \
&& docker-compose build
