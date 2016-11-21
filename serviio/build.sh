#!/bin/sh
set -e

SERVIIO=serviio-1.7.1.1
FILE="$SERVIIO-linux.tar.gz"
URL="http://download.serviio.org/releases/$FILE"

if [ ! -f "./$FILE" ]; then
	curl -Lk -o "$FILE" "$URL"
fi

if [ ! -d "./$SERVIIO" ]; then
	tar -zxvf "./$FILE"
fi
docker-compose build