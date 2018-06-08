docker stop heimdall
docker rm heimdall

docker create \
  --name=heimdall \
  -v /home/andry/docker/heimdall/config:/config \
  -e PGID=1000 -e PUID=1000  \
  -p 80:80 \
  -e TZ=Asia/Jakarta \
  lsioarmhf/heimdall

