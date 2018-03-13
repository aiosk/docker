#!/bin/sh
set -ex

docker build \
	--rm=true \
	--tag=aios/ubooquity \
.

