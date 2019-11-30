set -x

NAME=syncthing

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --env-file $PWD/.env \
  --publish 8384:8384 \
  --publish 22000:22000 \
  --publish 21027:21027/udp \
  --volume ~/.config/docker-$NAME/config:/config \
  --volume /mnt/data/downloads/sync-device:/data1 \
  --volume /mnt/data2/syncthing:/data2 \
  --restart unless-stopped \
  linuxserver/syncthing

#  --volume /mnt/data/Pictures:/data/photos/1 \

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
