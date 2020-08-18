#!/bin/sh

set -x

NAME=aria2-pro

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --env-file $PWD/.env \
  --name="$NAME" \
  --publish 6800:6800 \
  --env LISTEN_PORT=6888 \
  --publish 6888:6888 \
  --publish 6888:6888/udp \
  --restart=unless-stopped \
  --log-opt max-size=1m \
  --volume /mnt/data/downloads:/downloads \
  --volume ~/.config/docker-$NAME:/config \
  p3terx/aria2-pro


docker start "$NAME"
docker logs --follow --tail 99 "$NAME"
