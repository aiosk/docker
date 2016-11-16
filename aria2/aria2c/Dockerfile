FROM alpine

WORKDIR /root
ENV CONFIG=/root/.aria2/aria2.conf
COPY aria2.conf "$CONFIG"

RUN set -ex \
	&& apk add --no-cache aria2
