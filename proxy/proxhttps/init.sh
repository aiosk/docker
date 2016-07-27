#!/bin/bash
set -e

_start(){
	cd ./ProxHTTPSProxyMII \
	&& python3 ./ProxHTTPSProxy.py
	# tail -f /dev/null
}

_setup(){
	source /root/lib.sh

	local folder=/root/ProxHTTPSProxyMII
	local cacert="$folder/cacert.pem"
	local cacert_ori="$folder/cacert.ori.pem"

	if [ ! -f "$cacert_ori" ]; then 
		$(which cp) -rp "$cacert" "$cacert_ori"
		cat "$cacert_ori" /mnt/certs/myCA.pem > "$cacert"
	fi
}
_setup && \
_start