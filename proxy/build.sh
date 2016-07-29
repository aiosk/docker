#!/bin/sh
set -e

../replace-for-arm.sh

if [ ! -f ./proxhttps/ProxHTTPSProxyMII.zip ]; then
	curl -Lk -o ./proxhttps/ProxHTTPSProxyMII.zip https://github.com/wheever/ProxHTTPSProxyMII/archive/master.zip
fi
if [ ! -f ./privoxy/privoxy-blocklist.sh ]; then
	curl -Lk -o ./privoxy/privoxy-blocklist.sh https://raw.githubusercontent.com/atpage/privoxy-blocklist/master/privoxy-blocklist.sh
fi
echo squid privoxy proxhttps | xargs -n 1 cp ../lib.sh
docker-compose build 