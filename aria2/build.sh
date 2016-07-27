#!/bin/sh
../replace-for-arm.sh \
&& echo aria2c webui-aria2 | xargs -n 1 cp ../lib.sh \
&& docker-compose build