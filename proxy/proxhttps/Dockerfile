FROM debian

WORKDIR /root

RUN set -ex \
	&& runDeps='python3 python3-pip bash sed' \
	&& apt-get update && apt-get install -y --no-install-recommends $runDeps \

	&& apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
		/usr/share/man/* /usr/share/groff/* /usr/share/info/* \
		/usr/share/lintian /usr/share/linda /var/cache/man \

	&& (( find /usr/share/doc -depth -type f ! -name copyright|xargs rm || true )) \
	&& (( find /usr/share/doc -empty|xargs rmdir || true )) \
	
	&& find /usr/local -depth \
		\( \
		    \( -type d -a -name test -o -name tests \) \
		    -o \
		    \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
		\) -exec rm -rf '{}' + \
	&& rm -rf /usr/src/python ~/.cache

COPY req.txt ./
RUN set -ex \
	&& runDeps='python3-colorama python3-pysocks python3-openssl' \
	&& apt-get update && apt-get install -y --no-install-recommends $runDeps \
	
	&& pip3 install -r ./req.txt \
	
	&& apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
		/usr/share/man/* /usr/share/groff/* /usr/share/info/* \
		/usr/share/lintian /usr/share/linda /var/cache/man \

	&& (( find /usr/share/doc -depth -type f ! -name copyright|xargs rm || true )) \
	&& (( find /usr/share/doc -empty|xargs rmdir || true )) \
	
	&& find /usr/local -depth \
		\( \
		    \( -type d -a -name test -o -name tests \) \
		    -o \
		    \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
		\) -exec rm -rf '{}' + \
	&& rm -rf /usr/src/python ~/.cache
	
COPY ./ProxHTTPSProxyMII.zip /tmp/
RUN set -ex \
	&& buildDeps='unzip' \
	&& apt-get update && apt-get install -y --no-install-recommends $buildDeps \

	&& unzip /tmp/ProxHTTPSProxyMII.zip \

	&& mv ProxHTTPSProxyMII-master ProxHTTPSProxyMII \
	&& cp -rp ./ProxHTTPSProxyMII/config.ini ./ProxHTTPSProxyMII/config.ori.ini \

	&& apt-get purge -y --auto-remove $buildDeps \	
	&& apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
		/usr/share/man/* /usr/share/groff/* /usr/share/info/* \
		/usr/share/lintian /usr/share/linda /var/cache/man \

	&& (( find /usr/share/doc -depth -type f ! -name copyright|xargs rm || true )) \
	&& (( find /usr/share/doc -empty|xargs rmdir || true ))
	
COPY lib.sh ./
COPY init.sh ./proxhttps.sh
COPY config.ini ./ProxHTTPSProxyMII/