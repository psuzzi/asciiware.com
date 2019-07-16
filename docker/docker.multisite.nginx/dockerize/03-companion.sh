#!/bin/bash
# start the let’s encrypt nginx proxy companion.
docker run \
    --name nginx-proxy \
    --net dockerwp \
    -p 80:80 \
    -p 443:443 \
    -v ~/certs:/etc/nginx/certs \
    -v /etc/nginx/vhost.d \
    -v /usr/share/nginx/html \
    -v /var/run/docker.sock:/tmp/docker.sock:ro \
    --label com.github.jrcs.letsencrypt_nginx_proxy_companion.nginx_proxy \
    -d \
    --restart always jwilder/nginx-proxy