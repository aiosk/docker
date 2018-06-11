docker stop portainer
docker rm portainer

docker run -d \
  -p 9000:9000 \
  --name=portainer \
  --restart=unless-stopped \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /home/andry/docker/portainer/data:/data \
  portainer/portainer:linux-arm

docker logs --follow --tail 20 --timestamps portainer
