#!/bin/sh
set -e

docker build \
	--rm=true \
	--build-arg USER=andry \
	--build-arg PASS=yosuasamba \
	--tag=aios/samba \
.
