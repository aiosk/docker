set -x

NAME=baikal

docker stop  "$NAME"
docker rm "$NAME"

docker create \
  --name "$NAME" \
  --restart unless-stopped \
  -p 84:80 \
  -p 85:443 \
  -v $PWD/config:/var/www/baikal/Specific \
  --net mariadb_default \
  --link mariadb:db \
  ckulka/baikal:apache-arm32v7

docker start "$NAME"
docker logs --follow --tail 50 "$NAME"
