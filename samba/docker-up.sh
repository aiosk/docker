#!/bin/sh
set -e
NAME="aios_samba"

docker rm --force "$NAME"

docker run \
	--detach \
	--net=host \
	--restart=unless-stopped \
	--name="$NAME" \
	--volume=/mnt/data:/shares:rw \
	aios/samba \
	sh -c "inetd -d & /usr/sbin/nmbd -FS & /usr/sbin/smbd -FS"

docker logs --follow --tail 20 --timestamps "$NAME"
