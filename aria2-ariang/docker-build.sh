set -x

NAME=aria2-ariang

docker stop "$NAME"
docker rm "$NAME"

docker run -d \
  --name="$NAME" \
  --restart=unless-stopped \
  -p 81:80 \
  -p 6800:6800 \
  -e ENABLE_AUTH=true \
  -e RPC_SECRET=yosuaaria2 \
  -e ARIA2_USER=andry \
  -e ARIA2_PWD=yosuaaria2 \
  -v /mnt/data/downloads:/data \
  -v $PWD/aria2.conf:/root/conf/aria2.conf \
  -v $PWD/on-complete.sh:/root/conf/on-complete.sh \
  wahyd4/aria2-ui:arm32

#  -p 443:443 \
#  -e DOMAIN=example.com \
#  -v /yoursslkeys/:/root/conf/key \

docker start "$NAME"
docker logs --follow --tail 20 --timestamps "$NAME"
