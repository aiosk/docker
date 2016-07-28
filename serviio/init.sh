#!/bin/bash
set -e

folder=./serviio-1.6.1

_start(){
	bash "$folder/bin/serviio.sh" &
	bash "$folder/bin/serviio-console.sh" &
	tail -f /dev/null
}

_setup(){
	source /root/lib.sh

	__replace 'JAVA_OPTS=.*' 'JAVA_OPTS="-Djava.net.preferIPv4Stack=true -Djava.awt.headless=true -Dorg.restlet.engine.loggerFacadeClass=org.restlet.ext.slf4j.Slf4jLoggerFacade -Dderby.system.home=$SERVIIO_HOME/library -Dserviio.home=$SERVIIO_HOME -Dffmpeg.location=ffmpeg -Ddcraw.location=dcraw -Dserviio.boundAddr=$IPADDR -Dserviio.remoteHost=$IPADDR"' "$folder/bin/serviio.sh"
}
_setup && \
_start
