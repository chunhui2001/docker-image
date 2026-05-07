# chunhui2001/debian_13:haproxy-3.4.0
# Version 0.0.1
FROM haproxy:3.4.0
# FROM envoyproxy/envoy-dev
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version
# uname -a
# uname -s
# uname -m
# lsb_release -cs
# haproxy -version
# haproxy -c -f /etc/haproxy/haproxy.cfg


USER root

### Install dev tools
RUN apt-get update -y && \
apt-get install -y nodejs npm vim lsb-release net-tools iputils-ping wget locales iproute2 gcc-multilib g++-multilib \
build-essential autoconf libssl-dev curl libcurl4-gnutls-dev zlib1g zlib1g-dev libxml2 libxml2-dev libxslt-dev \
libreadline6-dev libssl-dev openssl libssl-dev libperl-dev libgd-dev libgeoip-dev gzip \
libpam-dev libatomic-ops-dev make net-tools iputils-ping apt-utils supervisor wget tesseract-ocr libgl1-mesa-dev libglib2.0-0 && \
rm -rf /var/lib/apt/lists/* && \
apt-get clean && \
apt-get autoclean

RUN npm install -g wscat

# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV LC_ALL=C.UTF-8

# WORKDIR /root

# docker build --platform linux/amd64 -f Dockerfile . -t 'chunhui2001/debian_13:haproxy-3.4.0'
# docker run -dit -u root --entrypoint="top" -P --name haproxy chunhui2001/debian_13:haproxy-3.4.0
# docker run -dit -u root -p 5000:5000 --name envoy-1.38.0 chunhui2001/debian_13:haproxy-3.4.0
# docker push chunhui2001/debian_13:haproxy-3.4.0
# docker pull chunhui2001/debian_13:haproxy-3.4.0
