#!/bin/sh
docker exec -it $(docker ps | grep aria2c | awk '{print $1}') bash