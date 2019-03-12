set -x

NAME=nextcloud

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --restart=unless-stopped \
  -e PUID=1000 -e PGID=996 \
  -e TZ=Asia/Jakarta \
  -p 82:443 \
  -v $PWD/config:/config \
  -v $PWD/data:/data \
  -v /mnt/data/Pictures:/mnt/photos \
  --net mariadb_default \
  --link mariadb:db \
  linuxserver/nextcloud

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
