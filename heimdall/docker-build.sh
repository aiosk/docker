set -x

NAME=heimdall

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --restart=unless-stopped \
  -v $PWD/config:/config \
  -e PGID=996 -e PUID=1000  \
  -p 84:80 \
  -e TZ=Asia/Jakarta \
  linuxserver/heimdall

#  -p 443:443 \
docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
