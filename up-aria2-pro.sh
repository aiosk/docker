#!/usr/bin/env sh

set -x

# NAME=aria2-pro

# docker stop "$NAME"; docker rm "$NAME"

# docker run -d \
#   --env-file $PWD/.env \
#   --name="$NAME" \
#   --publish 6800:6800 \
#   --env LISTEN_PORT=6888 \
#   --publish 6888:6888 \
#   --publish 6888:6888/udp \
#   --restart=unless-stopped \
#   --log-opt max-size=1m \
#   --volume /mnt/data/downloads:/downloads \
#   --volume $HOME/.config/docker-$NAME:/config \
#   p3terx/aria2-pro

# docker stop ariang; docker rm ariang
# docker run -d \
#     --name ariang \
#     --log-opt max-size=1m \
#     --restart unless-stopped \
#     -p 6880:80 \
#     superng6/ariang 

# docker logs --follow --tail 99 "$NAME"
docker-compose -f docker-compose-aria2-pro.yml -p aria2-pro down

docker-compose -f docker-compose-aria2-pro.yml -p aria2-pro up -d

docker-compose -f docker-compose-aria2-pro.yml -p aria2-pro logs -f