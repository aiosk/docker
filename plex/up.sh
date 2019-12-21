set -x

NAME=plex

docker stop "$NAME"
docker rm "$NAME"

docker create \
    --env-file $PWD/.env \
    --env VERSION=docker \
    --device=/dev/dri:/dev/dri \
    --name="$NAME" \
    --net=host \
    --volume ~/.config/docker-$NAME/config:/config \
    --volume /mnt/data/Videos/Movies:/data/movies/1 \
    --volume /mnt/data2/Videos/Movies:/data/movies/2 \
    --volume /mnt/data2/Videos/Series:/data/tvshows \
    --volume /mnt/data/.transcode:/transcode \
    --volume /mnt/data/Videos/Self:/data/videos/self \
    --volume /mnt/data/Videos/Home:/data/videos/home \
    --volume /mnt/data/Videos/Show:/data/videos/shows \
    --volume /mnt/data2/Pictures:/data/photos \
    --restart=unless-stopped \
    linuxserver/plex

    # -p 32400:32400 \
    # -p 32400:32400/udp \
    # -p 32469:32469 \
    # -p 32469:32469/udp \
    # -p 5353:5353/udp \
    # -p 1900:1900/udp
#    --volume /mnt/data/.prn/vids:/data/nfk/videos/prn \
#    --volume /mnt/data/.prn/disturb/vids:/data/nfk/videos/disturb \
#    --volume /mnt/data/.prn/disturb/pics:/data/nfk/photos/disturb \
#    --volume /mnt/data/.prn/others:/data/nfk/photos/prn/others \
#    --volume /mnt/data/.prn/pics:/data/nfk/photos/prn/pics \

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
