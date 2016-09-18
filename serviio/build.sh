#!/bin/sh
set -e

FILE=serviio-1.7-linux.tar.gz
URL="http://download.serviio.org/releases/$FILE"

if [ ! -f "./$FILE" ]; then
	curl -Lk -o "$FILE" "$URL"
fi

../replace-for-arm.sh \
&& cp ../lib.sh ./lib.sh \
&& docker-compose build
