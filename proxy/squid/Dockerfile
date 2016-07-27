FROM alpine

WORKDIR /root

RUN	set -ex \
	&& buildDeps='' \
	&& runDeps='squid openssl ca-certificates bash sed' \
	&& apk --no-cache add $runDeps

RUN	set -ex \

	&& cd /etc/squid \
	&& mkdir ssl_cert \
	&& chown squid:squid . \
	&& chmod 700 ssl_cert \
	&& cd ssl_cert \

	&& openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout myCA.pem -out myCA.pem \
		-subj "/C=ID/ST=Jakarta/L=Jakarta/O=AIOS/OU=AIOS SQUID/CN=AIOS SQUID HTTPS"\
	&& openssl x509 -in myCA.pem -outform DER -out myCA.der \
	
	&& /usr/lib/squid/ssl_crtd -c -s /usr/lib/squid/ssl_db \
	&& chown -R squid:squid /usr/lib/squid/ssl_db \
	
	&& touch /var/log/squid/access.log /var/log/squid/cache.log \
	&& chown squid:squid /var/log/squid/access.log /var/log/squid/cache.log 
	
COPY init.sh ./squid.sh
COPY lib.sh ./
COPY squid.conf ./