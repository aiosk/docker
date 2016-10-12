#!/bin/sh
set -e

../replace-for-arm.sh \
&& cp ../lib.sh ./lib.sh \
&& docker-compose build