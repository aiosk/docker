FROM armhf/debian

WORKDIR /root

RUN set -ex \
        && export DEBIAN_FRONTEND='noninteractive' \
        && apt-get update && apt-get install -y --no-install-recommends --no-install-suggests ca-certificates aria2  \
        && rm -rf /var/lib/apt/lists/* \

        && apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y \
        && rm -rf /var/cache/debconf/*-old /usr/share/doc/* /usr/share/man/* /usr/share/groff/* /usr/share/info/* /usr/share/locale/* /tmp/* /var/tmp/*

RUN set -ex \
	&& useradd andry

COPY aria2.conf /home/andry/.aria2/aria2.conf
