#!/bin/sh

if [ ! -z $STREAM_HOST ]
   then
        sed -i -e "s/§STREAM_HOST/$STREAM_HOST/g" /usr/local/nginx/conf/nginx.conf \
               -e "s/§STREAM_HOST/$STREAM_HOST/g" /usr/local/nginx/html/index.html
   else
        sed -i -e "s/§STREAM_HOST/localhost/g" /usr/local/nginx/conf/nginx.conf \
               -e "s/§STREAM_HOST/localhost/g" /usr/local/nginx/conf/nginx.conf
fi

if [ ! -z  $PROTO ]
   then
        sed -i -e "s/§PROTO/$PROTO/g" /usr/local/nginx/html/index.html
   else
        sed -i -e "s/§PROTO/http/g" /usr/local/nginx/html/index.html
fi

nginx -g 'daemon off;'
