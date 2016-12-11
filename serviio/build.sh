#!/bin/sh
set -ex

SERVIIO=serviio-1.8
FILE="$SERVIIO-linux.tar.gz"
URL="http://download.serviio.org/releases/$FILE"
LIB="./library"

if [ ! -f "./$FILE" ]; then
	curl -Lk -o "$FILE" "$URL"
fi

if [ ! -d "./$SERVIIO" ]; then
	tar -zxvf "./$FILE"
	chmod 755 -R "./$SERVIIO"
	mv "./$SERVIIO/bin/serviio.sh" "./$SERVIIO/bin/serviio.old.sh"
	cp ./serviio.sh "./$SERVIIO/bin"
	
	cp -R "./$SERVIIO/library" "$LIB"
	echo yosuapi | sudo chmod 777 -R "$LIB"
fi
docker-compose build
