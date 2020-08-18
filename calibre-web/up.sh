#!/bin/sh

set -x

NAME=calibre-web

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --env-file $PWD/.env \
  --env DOCKER_MODS=linuxserver/calibre-web:calibre \
  --name="$NAME" \
  --publish 8083:8083 \
  --restart unless-stopped \
  --volume ~/.config/docker-$NAME:/config \
  --volume /mnt/data2/Books:/books \
  linuxserver/calibre-web

docker start "$NAME"
docker logs --follow --tail 99 "$NAME"
