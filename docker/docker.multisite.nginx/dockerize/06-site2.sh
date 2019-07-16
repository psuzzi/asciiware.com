#!/bin/bash
# start database
docker run \
    --name mariadb1 \
    --net dockerwp \
    -v mariadb1:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=supersecret \
    -e MYSQL_DATABASE=db1 \
    -e MYSQL_USER=db1user \
    -e MYSQL_PASSWORD=secret \
    -d --restart always mariadb
# start wordpress
docker run \
    --name wordpress2 \
    --net dockerwp \
    -v wordpress2:/var/www/html \
    -v ~/uploads.ini:/usr/local/etc/php/conf.d/uploads.ini \
    -e WORDPRESS_DB_HOST=mariadb2:3306 \
    -e WORDPRESS_DB_NAME=db2 \
    -e WORDPRESS_DB_USER=db2user \
    -e WORDPRESS_DB_PASSWORD=secret \
    -e VIRTUAL_HOST=site2.com \
    -e LETSENCRYPT_HOST=site2.com \
    -e LETSENCRYPT_EMAIL=admin2@email.com \
    -d \
    --restart always wordpress