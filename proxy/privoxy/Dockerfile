FROM alpine

WORKDIR /root

RUN	set -ex \
	&& runDeps='privoxy bash sed' \
	&& apk --no-cache add $runDeps \
	
	&& cp -rp /etc/privoxy/config /etc/privoxy/config.ori
COPY config /etc/privoxy/

COPY ./privoxy-blocklist.sh ./
RUN	set -ex \
	&& buildDeps='wget' \
	&& apk --no-cache add --virtual .build-deps $buildDeps \
	
	&& mkdir -p /etc/conf.d && /bin/bash ./privoxy-blocklist.sh \

	|| sed -i 's#URLS=.*#URLS=(\"https://easylist-downloads.adblockplus.org/easylist.txt\" \"https://raw.githubusercontent.com/ABPindo/indonesianadblockrules/master/subscriptions/abpindo.txt\" \"https://easylist-downloads.adblockplus.org/easyprivacy.txt\")#g' /etc/conf.d/privoxy-blacklist \
	&& sed -i 's~#PRIVOXY_~PRIVOXY_~g' /etc/conf.d/privoxy-blacklist \

	&& bash ./privoxy-blocklist.sh -v 3 \
	&& apk del .build-deps 

COPY ./lib.sh ./
COPY ./init.sh ./privoxy.sh