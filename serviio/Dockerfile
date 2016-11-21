FROM debian

WORKDIR /root

RUN set -ex \

	&& echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list \
	&& echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \

	&& apt-get update \

	&& echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
	&& echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \

	&& DEBIAN_FRONTEND=noninteractive \

	&& runDeps='oracle-java8-installer oracle-java8-set-default bash sed' \
	&& apt-get install -y --no-install-recommends $runDeps \

	&& apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
		/usr/share/man/* /usr/share/groff/* /usr/share/info/* \
		/usr/share/lintian /usr/share/linda /var/cache/man \
		/var/cache/oracle-jdk8-installer \

	&& (( find /usr/share/doc -depth -type f ! -name copyright|xargs rm || true )) \
	&& (( find /usr/share/doc -empty|xargs rmdir || true ))

RUN set -ex \
		&& echo "deb http://www.deb-multimedia.org jessie main non-free" | tee -a /etc/apt/sources.list \
		
		&& apt-get update \
		&& apt-get install -y --force-yes deb-multimedia-keyring \
		&& apt-get update \

		&& runDeps='ffmpeg' \
		&& apt-get install -y --no-install-recommends $runDeps \

		&& apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y \
		&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
				/usr/share/man/* /usr/share/groff/* /usr/share/info/* \
				/usr/share/lintian /usr/share/linda /var/cache/man \

		&& (( find /usr/share/doc -depth -type f ! -name copyright|xargs rm || true )) \
		&& (( find /usr/share/doc -empty|xargs rmdir || true ))