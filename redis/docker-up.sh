docker stop redis
docker rm redis

docker run \
  --name redis \
  --restart=unless-stopped \
  -v /home/andry/docker/redis/data:/data \
  -p 6379:6379 \
  -d \
  redis \
  redis-server --appendonly yes

docker logs --follow --tail 20 --timestamps redis
