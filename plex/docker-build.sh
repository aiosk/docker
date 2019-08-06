set -x

NAME=plex

docker stop "$NAME"
docker rm "$NAME"

docker create \
    --name="$NAME" \
    --net=host \
    --restart=unless-stopped \
    -e PUID=1000 -e PGID=996 \
    -e VERSION=docker \
    -v $PWD/config:/config \
    -v /mnt/data/Videos/Movies:/data/movies/1 \
    -v /mnt/data2/Videos/Movies:/data/movies/2 \
    -v /mnt/data2/Videos/Series:/data/tvshows \
    -v /mnt/data/.transcode:/transcode \
    -v /mnt/data/Videos/Self:/data/videos/self \
    -v /mnt/data/Videos/Home:/data/videos/home \
    -v /mnt/data/Videos/Show:/data/videos/shows \
    -v /mnt/data/Pictures:/data/photos/1 \
    -v /mnt/data2/Pictures:/data/photos/2 \
    linuxserver/plex

#    -v /mnt/data/.prn/vids:/data/nfk/videos/prn \
#    -v /mnt/data/.prn/disturb/vids:/data/nfk/videos/disturb \
#    -v /mnt/data/.prn/disturb/pics:/data/nfk/photos/disturb \
#    -v /mnt/data/.prn/others:/data/nfk/photos/prn/others \
#    -v /mnt/data/.prn/pics:/data/nfk/photos/prn/pics \

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
