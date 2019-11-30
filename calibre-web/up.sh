set -x

NAME=calibre-web

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --env-file $PWD/.env \
  --publish 8083:8083 \
  --volume ~/.config/docker-$NAME/config:/config \
  --volume /mnt/data2/Books:/books \
  --restart unless-stopped \
  linuxserver/calibre-web

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
