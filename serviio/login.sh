#!/bin/sh
set -e

docker exec -it $(docker ps | grep erviio| awk '{print $1}') bash
