#!/bin/sh
set -e

docker exec -it $(docker ps | grep samba | awk '{print $1}') sh