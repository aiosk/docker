docker stop aria2-with-webui
docker rm aria2-with-webui

docker run -d \
  --restart=unless-stopped \
  --name aria2-with-webui \
  -p 6800:6800 \
  -p 6880:80 \
  -p 6888:8080 \
  -v /mnt/data/downloads:/data \
  -v /home/andry/docker/aria2-webui/config:/conf \
  -e SECRET=Ym6rrXw7ax01mdx60qEu82N9V35u41tC \
  xujinkai/aria2-with-webui

docker logs --follow --tail 20 --timestamps aria2-with-webui
