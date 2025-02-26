#!/bin/sh

echo "Changing host to ${BORE_HOST}"
dockerize -template /etc/nginx/conf.d/default.tpl:/etc/nginx/conf.d/default.conf \
          -template /etc/nginx/bore-server.tpl:/etc/nginx/bore-server.conf \
          -wait tcp://$BORE_HOST:7835 -timeout 60s