#!/bin/sh
set -e

docker exec -it $(docker ps | grep plex| awk '{print $1}') bash
