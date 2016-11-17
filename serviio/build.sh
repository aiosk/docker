#!/bin/sh
set -e

FILE=serviio-1.7.1.1-linux.tar.gz
URL="http://download.serviio.org/releases/$FILE"

if [ ! -f "./$FILE" ]; then
	curl -Lk -o "$FILE" "$URL"
fi

if [ ! -d "./serviio-1.7.1.1" ]; then
	tar -zxvf "./$FILE"
fi
docker-compose build