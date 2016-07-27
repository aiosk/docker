FROM debian

WORKDIR /root

COPY plexmediaserver_1.0.2.2413-7caf41d_amd64.deb /tmp/
RUN	set -ex \
	&& dpkg -i /tmp/plexmediaserver_1.0.2.2413-7caf41d_amd64.deb \
	&& rm /tmp/*

COPY init.sh ./plex.sh
COPY lib.sh ./