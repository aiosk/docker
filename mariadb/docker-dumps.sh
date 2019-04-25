set -x

docker-compose exec mariadb sh -c 'exec mysqldump --databases nextcloud -uroot -p"$MYSQL_ROOT_PASSWORD"' > ./nextcloud.sql
