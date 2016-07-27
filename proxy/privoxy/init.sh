#!/bin/bash
set -e

folder=/etc/privoxy
config="$folder/config"
	
_start(){
	$(which privoxy) --no-daemon --user privoxy.privoxy "$config"
}

_setup(){
	source /root/lib.sh

	local user_action="$folder/user.action"
	local user_action_bef="$folder/user.action.bef"
	local user_filter="$folder/user.filter"
	local user_filter_bef="$folder/user.filter.bef"

	eval $BLOCK
	eval $FORWARD

	if [ ! -f "$user_action_bef" ]; then 
		$(which cp) -rp "$user_action" "$user_action_bef"
	else
		$(which cp) -rpf "$user_action_bef" "$user_action"
	fi
	block_header='{ +block{Nasty ads.} }'
	for site in "${BLOCK[@]}"; do
		__after "$block_header" "$site" "$user_action"
	done

	if [ ! -f $user_filter_bef ]; then 
		$(which cp) -rp "$user_filter" "$user_filter_bef"
	else
		$(which cp) -rpf "$user_filter_bef" "$user_filter"
	fi
	__insert 'CLIENT-HEADER-TAGGER: tagger4https' "$user_filter"
	__after 'CLIENT-HEADER-TAGGER: tagger4https' 's@^.*Tagged:.*ProxHTTPSProxyMII.*FrontProxy.*$@$0@i' "$user_filter"

	__insert '{ +client-header-tagger{tagger4https} }' "$user_action"
	__after '{ +client-header-tagger{tagger4https} }' 'TAG:.*?ProxHTTPSProxyMII' "$user_action"
	__after '{ +client-header-tagger{tagger4https} }' '{ +forward-override{forward 127.0.0.1:8081} }' "$user_action"
	__after_append_regex '{ +client-header-tagger{tagger4https} }' '\/' "$user_action"
}
_setup && \
_start