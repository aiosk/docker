set -x

NAME=heimdall

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --restart=unless-stopped \
  -v $PWD/config:/config \
  -e PGID=996 -e PUID=1000  \
  -p 80:80 \
  -p 443:443 \
  -e TZ=Asia/Jakarta \
  linuxserver/heimdall

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
