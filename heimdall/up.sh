set -x

NAME=heimdall

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --env-file $PWD/.env \
  --publish 84:80 \
  --publish 85:443 \
  --volume ~/.config/docker-$NAME/config:/config \
  --restart=unless-stopped \
  linuxserver/heimdall

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
