set -x

NAME=heimdall

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --restart=unless-stopped \
  -v $PWD/config:/config \
  -e PGID=1000 -e PUID=1000  \
  -p 82:80 \
  -e TZ=Asia/Jakarta \
  lsioarmhf/heimdall

