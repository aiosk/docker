#!/bin/sh
set -ex
NAME="aios_nfs"

docker stop "$NAME" || true && \
docker rm "$NAME" || true

docker run \
	--detach \
	--privileged \
	--publish 2049:2049 \
	--restart=unless-stopped \
	--name="$NAME" \
	--env SHARED_DIRECTORY=/nfsshare \
	--volume=/mnt:/nfsshare \
	aios/nfs

docker logs --follow --tail 20 --timestamps "$NAME"
