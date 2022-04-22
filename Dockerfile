FROM nginx:alpine

WORKDIR /app

COPY . .

RUN apk add --no-cache --virtual .build-deps make sudo && \
    make install && \
    hugo -s . && \
    make uninstall && \
    cp -r ./public/* /usr/share/nginx/html && \
    rm -rf /app && \
    apk del .build-deps
