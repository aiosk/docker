FROM alpine

WORKDIR /root
COPY aria2.conf /root/.aria2/aria2.conf

RUN set -ex \
	&& apk add --no-cache aria2
