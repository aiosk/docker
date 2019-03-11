set -x

NAME=lychee

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --name="$NAME" \
  --restart=unless-stopped \
  -e PUID=1000 -e PGID=996 \
  -e TZ=Asia/Jakarta \
  -p 81:80 \
  -v $PWD/config:/config \
  -v $PWD/data:/pictures \
  -v /mnt/data2/Pictures:/src/1 \
  -v /mnt/data/Pictures:/src/2 \
  -v /mnt/data/.prn/disturb/pics:/src/disturb \
  -v /mnt/data/.prn/others:/src/prn/1 \
  linuxserver/lychee

#  -v /mnt/data/.prn/Pictures:/src/prn/pics \
docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"

