set -x

NAME=portainer

docker stop "$NAME"
docker rm "$NAME"

docker create \
  -p 9000:9000 \
  --name="$NAME" \
  --restart=unless-stopped \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $PWD/data:/data \
  portainer/portainer:linux-arm \
  --admin-password='$2y$05$WBNuXau0MuuXQM6Ph72IpuwI8RHidC/5elLtA8jrd6cbNrVJEYwUy'

docker start "$NAME"
docker logs --follow --tail 20 --timestamps portainer
