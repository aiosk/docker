#!/bin/bash
set -e

_start(){
	sh /usr/sbin/start_pms
	# tail -f /dev/null
}

_setup(){
	source /root/lib.sh
	
	# touch /root/.config/UMS/WEB.conf
}
_setup && \
_start
