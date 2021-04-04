FROM nginx:alpine

RUN apk add --no-cache hugo
ADD . /app
WORKDIR /app
RUN hugo -s . && \
    apk del hugo && \
    cp -r /app/public/* /usr/share/nginx/html && \
    rm -rf /app
