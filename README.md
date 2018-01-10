# docker_nginx-rtmp

This Dockerfile is a Nginx Web Server compiled with RTMP module from @arut wich permits you streaming your Desktop
or make a VOD server.

This Dockerfile comes with an entire Web Page with FlowPlayer emebeded, thus you or others can watch what rou're streaming.

## How to use this Dockerfile

First, pull and build the image :
```
git clone git://github.com/pixhub/docker_nginx-rtmp
docker build -t some-name docker_nginx-rtmp
```

### Env Vars

In this image, you can parse some values like the internet protocol (http/https), the URL you want the Web server to be
reached from the outside and the URL where the web page catches the stream.

The Nginx Web Server is not configured with HTTPS. For that, you must put it behind a reverse proxy.
By default, values are :
```
PROTO=http
SERVER_NAME=localhost
STREAM_HOST=localhost
```

Example behind a reverse PROXY :
```
PROTO=https
SERVER_NAME=server.domain.com
STREAM_HOST=server.domain.com
```
or
```
PROTO=https
SERVER_NAME=server.domain.local
STREAM_HOST=server2.domain.local

### Ports

By defaults, http ans rtmp ports are configured in the container so :
```
http_host_port:80
rtmp_host_port:1935
```
For example, you can try in local by binding these ports on your local machine like that :
```
-p 80:80
-p 1935:1935
```

## Docker RUN

If the container is behind a Reverse PROXY with HTTPS :
```
docker run --name some-name -e PROTO=https -e SERVERNAME=server.domain.com -e STREAM_HOST=server.domain.com -p 80:80 -p 1935:1935 -d image_name
```
Running in local (don't forget to add the following in your /etc/hosts file : `127.0.0.1 server.domain.local`
```
docker run --name some-name -e PROTO=http -e SERVER_NAME=server.domain.local -e STREAM_HOST=server.domain.local -p 80:80 -p 1935:1935 -d pixhub/docker_nginx-rtmp

# How to Stream your Desktop into your container

I've put a ffmpeg2nginx.sh script with options. You can use it to stream your Desktop :
```
./ffmpeg2nginx.sh -s <your-screen-size> -r <frame-rate> -o <output-stream-size> -i <IP-or-FQDN>
```

Enjoy !


Best Regards,
pixhub.
