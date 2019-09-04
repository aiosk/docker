set -x

NAME=aria2-ariang

docker stop "$NAME"
docker rm "$NAME"

docker run -d \
  --name="$NAME" \
  --restart=unless-stopped \
  -p 81:80 \
  -p 6800:6800 \
  -e PUID=1000 \
  -e PGID=996 \
  -e ENABLE_AUTH=true \
  -e RPC_SECRET=yosuaaria2 \
  -e ARIA2_USER=andry \
  -e ARIA2_PWD=yosuaaria2 \
  -v /mnt/data/downloads:/data \
  -v /mnt/data/downloads/aria-filebrowser.db:/app/filebrowser.db \
  -v $PWD/aria2.conf:/root/conf/aria2.conf \
  wahyd4/aria2-ui:arm32

#  -p 443:443 \

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
