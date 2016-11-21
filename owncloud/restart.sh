#!/bin/sh
docker-compose restart \
&& docker-compose logs -f