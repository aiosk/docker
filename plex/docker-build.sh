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
    -v /mnt/data2/Videos/Series:/data/tvshows \
    -v /mnt/data/Videos/Movies:/data/movies/1 \
    -v /mnt/data2/Videos/Movies:/data/movies/2 \
    -v /mnt/data/.transcode:/transcode \
    linuxserver/plex

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
