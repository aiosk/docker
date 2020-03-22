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
    --volume /mnt/data2/.prn/vids:/data/nfk/videos/prn \
    --volume /mnt/data2/.prn/others:/data/nfk/photos/prn/others \
    --volume /mnt/data2/.prn/pics:/data/nfk/photos/prn/pics \
    --volume /mnt/data/.transcode:/transcode \
    --device /dev/dri:/dev/dri `#optional` \
    --restart unless-stopped \
    linuxserver/jellyfin

#    --volume /mnt/data2/.prn/disturb/vids:/data/nfk/videos/disturb \
#    --volume /mnt/data2/.prn/disturb/pics:/data/nfk/photos/disturb \

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
