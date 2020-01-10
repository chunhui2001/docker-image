# chunhui2001/alpine:ngrok
# Version 0.0.1
FROM golang:1.7.1-alpine
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ADD build.sh /

RUN apk add --no-cache git make openssl
RUN git clone https://github.com/inconshreveable/ngrok.git --depth=1 /ngrok
RUN sh /build.sh

VOLUME [ "/ngrok" ]

ENTRYPOINT ["/ngrok/bin/ngrokd"]
# CMD [ "/ngrok/bin/ngrokd"]

# https://blog.fengcl.com/2017/05/24/how-to-use-docker-build-ngrok-to-network-penetrate/
# https://www.lylinux.net/article/2018/9/18/51.html
# docker build . -t 'chunhui2001/alpine:ngrok'

### 服务端
# docker run -it -p 80:80 -p 4443:4443 -d chunhui2001/alpine:ngrok -domain="ngrok.snnmo.com" -httpAddr=":80"

## 设置域名
## 假如你有 xxx.com 这个域名。
## 你拿出 ngrok.xxx.com 这个子域去做映射
## 需要在 dns 服务商那里把
## 为 ngrok.xxx.com 增加一条A记录，指向 vps 的 ip。
## 并为 *.ngrok.xxx.com 增加一条A记录，也指向 vps 的 ip。

### 
# docker inspect ngrok_server

## tar -cf archive.tar foo bar  # Create archive.tar from files foo and bar.
## tar -tvf archive.tar         # List all files in archive.tar verbosely.
## tar -xf archive.tar          # Extract all files from archive.tar.

## docker run -dit --entrypoint="top" --name ngrok_serv chunhui2001/alpine:ngrok

EXPOSE 8081

