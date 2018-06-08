docker stop ubooquity
docker rm ubooquity

docker create \
  --name=ubooquity \
  --restart=unless-stopped \
  -v /home/andry/docker/ubooquity/config:/config \
  -v /mnt/data2/Books:/books \
  -v /mnt/data2/Books:/comics \
  -v /mnt/data2/Books:/files \
  -e PGID=1000 -e PUID=1000  \
  -p 2202:2202 \
  -p 2203:2203 \
  lsioarmhf/ubooquity

