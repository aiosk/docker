#!/bin/sh
set -ex
NAME="aios_ubooquity"

docker stop "$NAME" || true && \
docker rm "$NAME" || true

docker run \
	--detach \
	--publish 2202:2202 \
	--publish 2502:2502 \
	--restart=unless-stopped \
	--name="$NAME" \
	--volume /home/andry/docker/ubooquity/config:/config:rw \
	--volume /mnt/data/Documents/Books:/media:rw \
	aios/ubooquity

docker logs --follow --tail 20 --timestamps "$NAME"
