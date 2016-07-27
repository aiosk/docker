#!/bin/sh
set -e

docker-compose up --remove-orphans -d \
&& docker-compose logs -f