set -x

NAME=nextcloud

docker stop "$NAME"
docker rm "$NAME"

if [ "$1" == "build" ];then
  docker create \
    --name="$NAME" \
    --restart=unless-stopped \
    -e MYSQL_DATABASE="$NAME" \
    -e MYSQL_USER="$NAME" \
    -e MYSQL_PASSWORD="$NAME" \
    -e MYSQL_HOST=db \
    -e NEXTCLOUD_ADMIN_USER=andry \
    -e NEXTCLOUD_ADMIN_PASSWORD=yosuanextcloud \
    -p 82:80 \
    -v $PWD/apps:/var/www/html/custom_apps \
    -v $PWD/config:/var/www/html/config \
    -v $PWD/data:/var/www/html/data \
    -v /mnt/data/Pictures:/mnt/photos \
    --net mariadb_default \
    --link mariadb:db \
    arm32v7/nextcloud:14
fi

#  -e PUID=1000 -e PGID=996 \
#  -e TZ=Asia/Jakarta \
docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
