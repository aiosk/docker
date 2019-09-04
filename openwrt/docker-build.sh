set -x

NAME=openwrt

docker stop "$NAME"
docker rm "$NAME"

docker create \
  --restart=unless-stopped \
  --name "$NAME" \
  --net host \
  --cap-add NET_ADMIN \
  nmaas87/rpi-openwrt:12.09_rpi \
  /sbin/init

docker start "$NAME"
docker exec -it "$NAME" opkg update
docker exec -it "$NAME" opkg install luci
#docker exec -it "$NAME" sed -i 's/:80/:81/g' /etc/config/uhttpd
docker exec -it "$NAME" /etc/init.d/uhttpd start
docker exec -it "$NAME" /etc/init.d/uhttpd enable
docker exec -it "$NAME" sed -i 's/22/23/g' /etc/config/dropbear
#docker stop "$NAME"

