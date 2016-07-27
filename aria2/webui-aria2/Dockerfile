FROM alpine

WORKDIR /root

RUN set -ex \
	&& addgroup -S nginx && adduser -DS -g nginx nginx \
	&& buildDeps='curl unzip' \
	&& runDeps='nginx bash sed' \
	&& apk --no-cache add $runDeps \
	&& apk --no-cache add --virtual .build-deps $buildDeps \

	&& curl -Lk -o /tmp/webui-aria2.zip https://github.com/ziahamza/webui-aria2/archive/master.zip \
	&& unzip /tmp/webui-aria2.zip \
	&& mkdir -p /usr/share/nginx \
	&& mv ./webui-aria2-master /usr/share/nginx/webui-aria2 \
	&& chown -R nginx:nginx /usr/share/nginx/webui-aria2 \

	&& apk del .build-deps \
	&& rm -rf /tmp/* 

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf
COPY lib.sh ./lib.sh
COPY init.sh ./webui.sh