set -x

NAME=nextcloud

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --restart=unless-stopped \
  -e PUID=1000 -e PGID=996 \
  -e TZ=Asia/Jakarta \
  -p 82:80 \
  -p 83:443 \
  -v $PWD/config:/config \
  -v $PWD/data:/data \
  -v /mnt/data/downloads/sync-device:/mnt/sync-device \
  -v /mnt/data/downloads:/mnt/downloads \
  -v /mnt/data/.prn:/mnt/.prn \
  --net mariadb_default \
  --link mariadb:db \
  linuxserver/nextcloud

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
