# chunhui2001/alpine:ngrok_client_java
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

WORKDIR /usr/local/

# 源码编译的 ngrok 
COPY ngrok_build.tar /usr/local/ 
# mac 版 ngrok 客户端
COPY ngrok-stable-darwin-amd64.zip.mac /usr/local/ 
# linux 版 ngrok 客户端
COPY ngrok-stable-linux-amd64.zip /usr/local/ 


RUN tar -xf ngrok_build.tar
ADD client.conf /usr/local/ngrok/client.conf


### 服务端
## docker run -it -p 80:80 -p 4443:4443 -d chunhui2001/alpine:ngrok -domain="ngrok.snnmo.com" -httpAddr=":80"

### 客户端
## /usr/local/ngrok/bin/linux_386/ngrok -config=/usr/local/ngrok/client.conf -subdomain=cloudbox 8081

### 启动 tcp
## ngrok -config=/usr/local/ngrok/client.conf -proto=tcp 22

## tar -cf archive.tar foo bar  # Create archive.tar from files foo and bar.
## tar -tvf archive.tar         # List all files in archive.tar verbosely.
## tar -xf archive.tar          # Extract all files from archive.tar.

# docker build . -t 'chunhui2001/alpine:ngrok_client_java'
# docker run -dit --name ngrok_client_java chunhui2001/alpine:ngrok_client_java top

CMD ["java", "-jar", "app.jar"]

EXPOSE 8081

