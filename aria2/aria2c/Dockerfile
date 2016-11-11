FROM alpine

WORKDIR /root
ENV CONFIG=/root/.aria2/aria2.conf
ARG TOKEN=undefined

COPY aria2.conf "$CONFIG"
RUN set -ex \
	&& apk add --no-cache aria2 \
	
	&& echo "rpc-secret=$TOKEN" >> "$CONFIG"
