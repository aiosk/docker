#!/bin/sh
docker exec -it $(docker ps | grep mysqld | awk '{print $1}') bash
