set -x

NAME=plex

docker stop "$NAME"
docker rm "$NAME"

docker create \
    --name="$NAME" \
    --net=host \
    --restart=unless-stopped \
    -e PUID=1000 -e PGID=996 \
    -v $PWD/config:/config \
    -v /mnt:/data/tvshows \
    -v /mnt:/data/movies \
    -v /mnt/data2/.transcode:/transcode \
    lsioarmhf/plex

docker start plex
docker logs --follow --tail 20 --timestamps plex
