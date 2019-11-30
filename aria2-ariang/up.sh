set -x

NAME=aria2-ariang

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --env-file $PWD/.env \
  --env ENABLE_AUTH=true \
  --env RPC_SECRET=yosuaaria2 \
  --env ARIA2_USER=andry \
  --env ARIA2_PWD=yosuaaria2 \
  --publish 81:80 \
  --publish 6800:6800 \
  --volume /mnt/data/downloads:/data \
  --volume /mnt/data/downloads/aria-filebrowser.db:/app/filebrowser.db \
  --volume $PWD/$NAME/aria2.conf:/root/conf/aria2.conf \
  --restart=unless-stopped \
  wahyd4/aria2-ui:arm32

#  --publish 443:443 \

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
