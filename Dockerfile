FROM alpine:3.7

ENV NGINX_VERSION=1.13.7 \
    STREAM_HOST=localhost \
    PROTO=http

RUN adduser -S -D -h /home/nginx
    apk update && \
    apk add \
        build-base \
        zlib-dev \
        pcre-dev \
        openssl-dev \
        wget \
        git && \
    cd /tmp && \
    git clone git://github.com/arut/nginx-rtmp-module.git && \
    wget http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz && \
    tar xzvf nginx-$NGINX_VERSION.tar.gz && \
    cd /tmp/nginx-$NGINX_VERSION && \
    ./configure \
        --add-module=../nginx-rtmp-module \
        --user=nginx \
        --group=nginx \
        --prefix=/etc/nginx \
        --conf-path=/etc/nginx/conf/nginx.conf \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --sbin-path=/usr/sbin/nginx \
        --pid-path=/run/nginx.pid && \
    make && \
    make install && \
    cd / && \
    rm -rf /tmp/* && \
    apk del \
        git \
        build-base \
        wget

USER nginx

RUN mkdir /home/nginx/HLS && \
    mkdir /home/nginx/HLS/live \
    mkdir /home/nginx/video_recordings

COPY files /

CMD ["/run.sh"]
