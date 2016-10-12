#!/bin/bash
set -e

_start(){
	$(which nmbd) -FS -s ./smb.conf -d 1 &
	$(which smbd) -FSs ./smb.conf -d 2 
	#tail -f /dev/null
}

_setup(){
	source /root/lib.sh
	
	# echo 'yosuasamba' | tee - | $(which smbpasswd) -c ./smb.conf -a andry
	echo 'yosuasamba' | tee - | $(which smbpasswd)  -c ./smb.conf -D 3 -a andry
	# && echo 'shared' | tee - | $(which smbpasswd) -a shared
	
	local pidfile=/var/run/smbd-smb.conf.pid
	if [ -f "$pidfile" ]; then
		rm -f "$pidfile"
	fi
}
_setup && \
_start
