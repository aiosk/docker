#!/bin/sh
# sudo mount -t vboxsf d/Documents/Projects /d/Documents/Projects
FILE="master.zip"
URL="https://github.com/ziahamza/webui-aria2/archive/$FILE"

if [ ! -f "./webui/$FILE" ]; then
	curl -Lk -o "./webui/$FILE" "$URL"
fi
if [ ! -d "./webui/webui-aria2-master" ]; then
	unzip "./webui/$FILE" -d "./webui"
	cp ./webui/webui-aria2-master/configuration.js ./webui/webui-aria2-master/configuration.old.js
	cp ./webui/configuration.js ./webui/webui-aria2-master/configuration.js
fi

docker-compose build

