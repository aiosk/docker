docker stop smokeping
docker rm smokeping

docker create \
  --name smokeping \
  --restart=unless-stopped \
  -p 90:80 \
  -e PUID=1000 -e PGID=1000 \
  -e TZ=Asia/Jakarta \
  -v /home/andry/docker/smokeping/data:/data \
  -v /home/andry/docker/smokeping/config:/config \
  lsioarmhf/smokeping
