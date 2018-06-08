docker stop plex
docker rm plex

docker create \
    --name=plex \
    --net=host \
    --restart=unless-stopped \
    -e PUID=1000 -e PGID=1000 \
    -v /home/andry/docker/plex/config:/config \
    -v /mnt:/data/tvshows \
    -v /mnt:/data/movies \
    -v /mnt/data2/.transcode:/transcode \
    lsioarmhf/plex
