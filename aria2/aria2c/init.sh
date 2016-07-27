#!/bin/bash
set -ex

_start(){
	touch "/mnt/downloads/aria2-session.txt" \
	&& aria2c
}

_setup(){
	source /root/lib.sh
	
	__insert "rpc-secret=$TOKEN" "$CONFIG"
	cat "$CONFIG"
}
_setup && \
_start