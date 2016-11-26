#!/bin/sh
set -ex

SERVIIO=serviio-1.7.1.1
FILE="$SERVIIO-linux.tar.gz"
URL="http://download.serviio.org/releases/$FILE"
LIB=library

if [ ! -f "./$FILE" ]; then
	curl -Lk -o "$FILE" "$URL"
fi

if [ ! -d "./$SERVIIO" ]; then
	tar -zxvf "./$FILE"
	chmod 755 -R "./$SERVIIO"
	mkdir -p "./$SERVIIO/log"
	chmod 777 -R "./$SERVIIO/log"
	
	cp -R "./$SERVIIO/library" "./$LIB"
	chmod 777 -R "./$LIB"
fi
docker-compose build