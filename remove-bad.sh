#!/bin/sh
docker rm -fv $(docker ps -qa -f status=exited -f status=restarting -f status=created) ; \
docker rmi $(docker images -qf dangling=true)
