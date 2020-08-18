#!/bin/sh

set -x

NAME=jellyfin

docker stop "$NAME"
docker rm "$NAME"

docker create \
    --name="$NAME" \
    --env-file $PWD/.env \
    -p 8096:8096 \
    -p 8920:8920 `#optional` \
    --volume ~/.config/docker-$NAME:/config \
    --volume /mnt/data/Videos/Movies:/data/movies/1 \
    --volume /mnt/data2/Videos/Movies:/data/movies/2 \
    --volume /mnt/data2/Videos/Series:/data/tvshows \
    --volume /mnt/data/.transcode:/transcode \
    -v /opt/vc/lib:/opt/vc/lib `#optional` \
    --device /dev/dri:/dev/dri `#optional` \
    --restart unless-stopped \
    linuxserver/jellyfin

#    --device /dev/video12:/dev/video12 `#optional` \
#    --device /dev/video11:/dev/video11 `#optional` \
#    --device /dev/video10:/dev/video10 `#optional` \
#    --device /dev/vchiq:/dev/vchiq `#optional` \

docker start "$NAME"
docker logs --follow --tail 99 "$NAME"
