#!/bin/sh
set -e
FILE=plexmediaserver_1.0.2.2413-7caf41d_amd64.deb

if [ ! -f "./${FILE}" ]; then
	curl -LkO "https://downloads.plex.tv/plex-media-server/1.0.2.2413-7caf41d/${FILE}"
fi

../replace-for-arm.sh \
&& cp ../lib.sh ./lib.sh \
&& docker-compose build