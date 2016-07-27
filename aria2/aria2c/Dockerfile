FROM alpine

WORKDIR /root

RUN set -ex \
	&& buildDeps='' \
	&& runDeps='aria2 bash sed' \
	&& apk add --no-cache $runDeps

COPY lib.sh ./lib.sh
COPY init.sh ./aria2c.sh
COPY aria2.conf ./.aria2/aria2.conf