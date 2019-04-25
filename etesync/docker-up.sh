set -x

NAME=etesync

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name "$NAME" \
  -p 3735:3735 \
  --restart unless-stopped \
  -e SERVER=https \
  -e SUPER_USER=andry@etesync.pi \
  -e SUPER_PASS=yosuaetesync \
  -e SUPER_EMAIL=andry@etesync.pi \
  -e TIME_ZONE=Asia/Jakarta \
  -e PUID=1000 \
  -e PGID=996 \
  -v $PWD/data:/data \
  aiosk/"$NAME"

docker start "$NAME"
docker logs --follow --tail 50 "$NAME"
