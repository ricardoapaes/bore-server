FROM nginx:alpine

ENV DOCKERIZE_VERSION v0.8.0
RUN apk update --no-cache \
    && apk add --no-cache wget openssl \
    && wget -O - https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz | tar xzf - -C /usr/local/bin \
    && apk del wget

ENV BORE_HOST="bore-server"
COPY default.conf /etc/nginx/conf.d/default.tpl
COPY bore-server.conf /etc/nginx/bore-server.tpl
COPY change-host.sh /docker-entrypoint.d/00-change-host.sh
RUN chmod +x /docker-entrypoint.d/00-change-host.sh

RUN echo "include /etc/nginx/bore-server.conf;" >> /etc/nginx/nginx.conf