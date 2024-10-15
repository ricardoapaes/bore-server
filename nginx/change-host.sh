#!/bin/sh

echo "Changing host to ${BORE_HOST}"
dockerize -template /etc/nginx/conf.d/default.tpl:/etc/nginx/conf.d/default.conf \
          -wait tcp://$BORE_HOST:7835 -timeout 60s