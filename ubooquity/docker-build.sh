docker stop ubooquity
docker rm ubooquity

docker create \
  --name=ubooquity \
  --restart=unless-stopped \
  -v /home/andry/docker/ubooquity/config:/config \
  -v /mnt/data2/Books:/books \
  -v /mnt/data2/PDFs:/books2 \
  -v /mnt/data/NewFolder/Comics:/comics \
  -v /mnt/data/NewFolder/Comics:/files \
  -e PGID=996 -e PUID=1000  \
  -p 2202:2202 \
  -p 2203:2203 \
  lsioarmhf/ubooquity

docker start ubooquity
docker logs --follow --tail 20 --timestamps ubooquity
