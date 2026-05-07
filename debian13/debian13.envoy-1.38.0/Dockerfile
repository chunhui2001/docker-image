# chunhui2001/debian_13:envoy-1.38.0
# Version 0.0.1
FROM envoyproxy/envoy:v1.38-latest
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


ENV GOLANG_VERSION=1.26.3
ENV PATH="$PATH:/usr/local/go/bin"

### Install dev tools
RUN apt-get update -y && \
apt-get install -y vim lsb-release net-tools iputils-ping wget locales iproute2 gcc-multilib g++-multilib \
build-essential autoconf libssl-dev curl libcurl4-gnutls-dev zlib1g zlib1g-dev libxml2 libxml2-dev libxslt-dev \
libreadline6-dev libssl-dev openssl libssl-dev libperl-dev libgd-dev libgeoip-dev gzip \
libpam-dev libatomic-ops-dev make net-tools iputils-ping apt-utils supervisor wget tesseract-ocr libgl1-mesa-dev libglib2.0-0 && \
curl -L "https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz" > /usr/local/go${GOLANG_VERSION}.linux-amd64.tar.gz && \
tar -xvf /usr/local/go${GOLANG_VERSION}.linux-amd64.tar.gz -C /usr/local/ && \
mv /usr/local/go /usr/local/go${GOLANG_VERSION}.linux-amd64 && \
ln -s /usr/local/go${GOLANG_VERSION}.linux-amd64 /usr/local/go && \
rm -rf /usr/local/go${GOLANG_VERSION}.linux-amd64.tar.gz && \
rm -rf /var/lib/apt/lists/* && \
apt-get clean && \
apt-get autoclean

# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV LC_ALL=C.UTF-8

WORKDIR /root

# 查看版本
# envoy --version
# envoy --help
# envoy --mode validate -c /etc/envoy/demo.yaml
# envoy -c /etc/envoy/demo.yaml
# strings $(which envoy) | grep wasm

# docker build --platform linux/amd64 -f Dockerfile . -t 'chunhui2001/debian_13:envoy-1.38.0_amd'
# docker build --platform linux/arm64 -f Dockerfile . -t 'chunhui2001/debian_13:envoy-1.38.0_arm'
# docker run -dit --entrypoint="top" -P --name envoy-1.38.0 chunhui2001/debian_13:envoy-1.38.0_arm
# docker run -dit -p 5000:5000 --name envoy-1.38.0 chunhui2001/debian_13:envoy-1.38.0
# docker push chunhui2001/debian_13:envoy-1.38.0
# docker pull chunhui2001/debian_13:envoy-1.38.0
