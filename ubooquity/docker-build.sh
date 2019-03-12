set -x

NAME=ubooquity

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --restart=unless-stopped \
  -e PGID=996 -e PUID=1000 \
  -e TZ=Asia/Jakarta \
  -e MAXMEM=256 \
  -p 2202:2202 \
  -p 2203:2203 \
  -v $PWD/config:/config \
  -v /mnt/data2/Books:/books/epub \
  -v /mnt/data2/PDFs:/books/pdf \
  -v /mnt/data/.prn/Comics:/comics \
  linuxserver/ubooquity

#  -v /mnt/data/.prn/Comics:/files \

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
