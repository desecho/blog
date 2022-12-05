# https://hub.docker.com/_/nginx
FROM nginx:1.23.2-alpine

WORKDIR /app

COPY . .

RUN apk add --no-cache --virtual .build-deps make=4.3-r0 sudo=1.9.12-r1 \
    && make install \
    && hugo -s . \
    && make uninstall \
    && cp -r ./public/* /usr/share/nginx/html \
    && rm -rf /app \
    && apk del .build-deps
