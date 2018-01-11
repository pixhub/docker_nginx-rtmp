#!/bin/sh

if [ ! -z $SERVER_NAME ]
   then
	sed -i -e "s/§SERVER_NAME/$SERVER_NAME/g" /etc/nginx/conf/nginx.conf
   else
	sed -i -e "s/§SERVER_NAME/localhost/g" /etc/nginx/conf/nginx.conf
fi

if [ ! -z $STREAM_HOST ]
   then
        sed -i -e "s/§STREAM_HOST/$STREAM_HOST/g" /etc/nginx/html/index.html
   else
        sed -i -e "s/§STREAM_HOST/localhost/g" /etc/nginx/html/index.html
fi

if [ ! -z  $PROTO ]
   then
        sed -i -e "s/§PROTO/$PROTO/g" /etc/nginx/html/index.html
   else
        sed -i -e "s/§PROTO/http/g" /etc/nginx/html/index.html
fi

nginx -g 'daemon off;'
