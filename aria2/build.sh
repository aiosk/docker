#!/bin/sh
FILE="master.zip"
URL="https://github.com/ziahamza/webui-aria2/archive/$FILE"

if [ ! -f "./webui/$FILE" ]; then
	curl -Lk -o "./webui/$FILE" "$URL"
fi
if [ ! -d "./webui/webui-aria2-master" ]; then
	unzip "./webui/$FILE" -d "./webui"
fi
docker-compose build