#!/bin/bash

IP=192.168.1.2
PORT=6800
JSONRPC=jsonrpc
HEADER1="Content-Type: application/json"
HEADER2="Accept: application/json"
TOKEN=Ym6rrXw7ax01mdx60qEu82N9V35u41tC

case "$1" in
	start)
		METHOD="aria2.unpauseAll"
	;;
	stop)
		METHOD="aria2.pauseAll"
	;;
	*)
		echo "Parameter Wrong";
		exit 0
	;;
esac

DATA="{\"jsonrpc\": \"2.0\",\"id\":1, \"method\": \"$METHOD\", \"params\":[\"token:$TOKEN\"]}"
echo "$METHOD"

curl http://"$IP":"$PORT"/"$JSONRPC" -H "$HEADER1" -H "$HEADER2" \
	--data "$DATA"

exit 0
