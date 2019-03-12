#!/bin/sh

#if [ $2 -eq 1 ]; then
#	mv "$3" /data
#	chown 1000:1000 "/data/$3"
#fi
#echo [$(date)] $2, $3, $1 "<br>" >> /data/_log.html

chown 1000:996 "$3"
