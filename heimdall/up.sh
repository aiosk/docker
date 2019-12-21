set -x

NAME=heimdall

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --env-file $PWD/.env \
  --name="$NAME" \
  --publish 84:80 \
  --publish 85:443 \
  --restart=unless-stopped \
  --volume ~/.config/docker-$NAME/config:/config \
  linuxserver/heimdall

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
