#!/bin/sh
set -e

docker-compose restart \
&& docker-compose logs -f