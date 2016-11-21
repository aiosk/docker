#!/bin/sh
set -e

docker exec -it $(docker ps | grep serviio| awk '{print $1}') sh
