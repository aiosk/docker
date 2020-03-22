set -x

NAME=etesync-dav
VOL_DATA=~/.config/docker-"$NAME"
EMAIL=andry_yosua@yahoo.com

# docker run -it --rm -v "$VOL_DATA":/data etesync/etesync-dav manage add "$EMAIL"
docker run --name "$NAME" -d -v "$VOL_DATA":/data -p 37358:37358 -p 37359:37359 --restart=unless-stopped etesync/etesync-dav

#Initializing account
User: andry_yosua@yahoo.com
Password: wWT8cNlNYy1IVZCp
