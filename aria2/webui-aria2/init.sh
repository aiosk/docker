#!/bin/bash
set -ex

_start(){
	nginx -g 'daemon off;'
}

_setup(){
	source /root/lib.sh

	local config="$DIR/configuration.js"
	local aria2c_ip=$(getent hosts aria2c| awk '{print $1}')
	__after_find_regex 'auth:.*' "    token: '$TOKEN'," "$config"
	__append '\(host:\).*' "'$aria2c_ip'," "$config"
}
_setup && \
_start
