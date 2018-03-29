#!/bin/sh
set -ex
NAME="aios_nfs"

docker stop "$NAME" || true && \
docker rm "$NAME" || true

docker run \
	--detach \
	--privileged \
	--net host \
	--restart=unless-stopped \
	--name="$NAME" \
	--env NFS_DISABLE_VERSION_3=1 \
	--env NFS_EXPORT_1='/nfs/data2 *(rw,no_subtree_check)' \
	--volume=/mnt/data:/nfs/data \
	--volume=/mnt/data2:/nfs/data2 \
	aios/nfs

docker logs --follow --tail 20 --timestamps "$NAME"
