set -x

NAME=taisun

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --restart=unless-stopped \
  -p 3000:3000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  linuxserver/taisun

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"

