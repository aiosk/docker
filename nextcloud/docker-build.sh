docker stop nextcloud
docker rm nextcloud

docker create \
    --name=nextcloud \
    --restart=unless-stopped \
    -p 443:443 \
    -e PUID=1000 -e PGID=1000 \
    -v /home/andry/docker/nextcloud/config:/config \
    -v /home/andry/docker/nextcloud/data:/data \
    -v /mnt:/mnt \
    lsioarmhf/nextcloud
