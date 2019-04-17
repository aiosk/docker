set -x

NAME=syncthing

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  -e PUID=1000 -e PGID=996 \
  -e TZ=Asia/Jakarta \
  -e UMASK_SET=022 \
  -p 8384:8384 \
  -p 22000:22000 \
  -p 21027:21027/udp \
  -v $PWD/config:/config \
  -v /mnt/data/Pictures:/data2/pictures \
  --restart unless-stopped \
  linuxserver/syncthing

#  -v </path/to/data1>:/data1 \
#  -v /mnt/data/Pictures:/data/photos/1 \

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
