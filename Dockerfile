FROM nginx:alpine

COPY . /app
WORKDIR /app
RUN apk add --no-cache --virtual .build-deps make sudo && \
    make install && \
    hugo -s . && \
    make uninstall && \
    cp -r /app/public/* /usr/share/nginx/html && \
    rm -rf /app && \
    apk del .build-deps
