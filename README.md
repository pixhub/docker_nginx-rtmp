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

In this image, you can parse some values like the internet protocol (http/https) and the URL you want the Web server to be
reached from the outside.

The Nginx Web Server is not configured with HTTPS. For that, you must put it behind a reverse proxy.
By default, values are :
```
PROTO=http
STREAM_HOST=localhost
```

Example behind a reverse PROXY :
```
PROTO=https
STREAM_HOST=server.domain.com
```

### Ports

By defaults, http ans rtmp ports are configured in the container so :
```
http_host_port:80
rtmp_host_port:1935
```

## Docker RUN

```
docker run --name some-name -e PROTO=https -e STREAM_HOST=server.domain.com -p 80:80 -p 1935:1935 -d image_name
```

# How to Stream your Desktop into your container

I've put a ffmpeg2nginx.sh script with options. You can use it to stream your Desktop :
```
./ffmpeg2nginx.sh -s <your-screen-size> -r <frame-rate> -o <output-stream-size> -i <IP-or-FQDN>
```

Enjoy !


Best Regards,
pixhub.
