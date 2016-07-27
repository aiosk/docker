#!/bin/bash
set -e

_start(){
	local config="./squid.conf"
	
	$(which squid) -d 1 -Nf "$config" -z \
	&& $(which squid) -d 1 -Nf "$config" & 
	tail -f /var/log/squid/access.log
}

_setup(){
	# source /root/lib.sh
	
	cp /etc/squid/ssl_cert/* /mnt/caches
	
	local pidfile=/var/run/squid.pid
	if [ -f pidfile ]; then
		rm pidfile
	fi
}
_setup && \
_start