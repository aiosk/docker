#!/bin/sh
set -ex
NAME="aios_samba"

docker stop "$NAME" || true && \
docker rm "$NAME" || true

docker run \
	--detach \
	--publish 137:137/udp \
	--publish 138:138/udp \
	--publish 139:139 \
	--publish 445:445 \
	--env TZ=Asia/Jakarta \
	--restart=unless-stopped \
	--name="$NAME" \
	--volume=/mnt/data:/shares:rw \
	--volume=/mnt/data2:/shares2:rw \
	dperson/samba:armhf \
	-n -W -S \
	-u "andry;yosuasamba;1000;1000" \
	-s "data;/shares;yes;no;no;andry;andry;andry;data hdd1" \
	-s "data2;/shares2;yes;no;no;andry;andry;andry;data hdd2" \
	-s "Nono;/shares/NewFolder;yes;yes;no;andry;andry;andry;No no" \
	-s "Videos;/shares/Videos;yes;yes;yes;all;andry;andry;Videos hdd1" \
	-s "Videos2;/shares2/Videos;yes;yes;yes;all;andry;andry;Videos hdd2" \
	-w "WORKGROUP" \
	-g "oplocks = no" \
	-g "kernel oplocks = no" \
	-g "csc policy = disable"

docker logs --follow --tail 20 --timestamps "$NAME"
