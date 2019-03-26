set -x

NAME=calibre-web

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  -e PGID=996 -e PUID=1000 \
  -e TZ=Asia/Jakarta \
  -p 8083:8083 \
  -v $PWD/config:/config \
  -v /mnt/data2/Books:/books \
  --restart unless-stopped \
  linuxserver/calibre-web

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
