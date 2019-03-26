#!/bin/sh

#if [ $2 -eq 1 ]; then
#	mv "$3" /data
#	chown 1000:1000 "/data/$3"
#fi

LOG=/data/_log.html

if [ "$2" == "0" ]; then
  echo [$(date)] "$1": "no file" "<br/>" >> "$LOG"
  exit 0
fi

if [ "$2" == "1" ]; then
  chown 1000:996 "$3"
  echo [$(date)] "$1": "$2", "$3" "<br/>" >> "$LOG"
  exit $?
fi

DIR=$(echo "$3" | cut -d/ -f 1-3)
chown -R 1000:996 "$DIR"
echo [$(date)] "$1": "$2", "$DIR", "$3" "<br/>" >> "$LOG"
exit $?
