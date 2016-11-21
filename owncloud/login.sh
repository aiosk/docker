#!/bin/sh
docker exec -it $(docker ps | grep owncloud | awk '{print $1}') bash
