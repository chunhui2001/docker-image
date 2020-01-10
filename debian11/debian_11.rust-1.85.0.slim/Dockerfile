# chunhui2001/debian11:rust-1.85.0-slim
# Version 0.0.1
FROM rust:1.85.0-slim
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version
# uname -a

### How to Install CMake on Debian 12, 11 or 10
# https://www.linuxcapable.com/how-to-install-cmake-on-debian-linux/
### How to Install OpenSSL on Debian 12
# https://itslinuxfoss.com/install-openssl-debian-12/
### Manually update OpenSSL on Debian to 1.1.1.t
# https://fearby.com/article/manually-update-openssl-on-debian-to-1-1-1-t/

### Install dev tools
RUN apt-get -qq update -y &&\
apt-get install -y \
vim build-essential lsb-release net-tools iputils-ping wget ttf-wqy-microhei locales iproute2 lld \
clang apt-transport-https ca-certificates curl software-properties-common autoconf libssl-dev libsasl2-dev libzstd-dev musl-tools \
libudev-dev librust-openssl-sys-dev libcurl4-gnutls-dev zlib1g zlib1g-dev cmake libxml2 libxml2-dev libxslt-dev \
libreadline6-dev libpcre3 libpcre3-dev openssl pkg-config libperl-dev libgd-dev libgeoip-dev libpam-dev \
libatomic-ops-dev lua5.1 liblua5.1-0 liblua5.1-0-dev checkinstall llvm nettle-dev libavutil-dev

RUN ln -s /usr/include/x86_64-linux-gnu/asm /usr/include/x86_64-linux-musl/asm &&\
ln -s /usr/include/asm-generic /usr/include/x86_64-linux-musl/asm-generic &&\
ln -s /usr/include/linux /usr/include/x86_64-linux-musl/linux &&\
cd /root

### check versions
# cargo version
# cmake --version
# make --version
# openssl version
# /musl/bin/openssl version
# /musl/bin/openssl version -a

# rustup target list
# rustup default
# rustc --version  > rustc 1.75.0 (69f9c33d7 2022-12-12)
# cargo --list
# openssl version  > OpenSSL 3.0.7 1 Nov 2022 (Library: OpenSSL 3.0.7 1 Nov 2022)
# openssl version -a

### check pthread
# dpkg -L libc6-dev | grep pthread
# dpkg -L libc6 | grep pthread

ENV PKG_CONFIG_ALLOW_CROSS=1
ENV OPENSSL_STATIC=true
ENV OPENSSL_DIR=/musl

# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 开启中文支持
RUN locale-gen zh_CN.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN locale-gen zh_CN.UTF-8
#RUN echo 'export LC_ALL=C;unset LANGUAGE' >> /etc/profile

ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV LC_ALL=zh_CN.UTF-8

#RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && rustup target add x86_64-unknown-linux-musl

RUN adduser --disabled-password --gecos '' rurst
RUN adduser rurst sudo
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#USER rurst

## https://zenn.dev/kinzal/articles/9ee60ebbebc29c
# docker build --platform linux/amd64 -f Dockerfile . -t 'chunhui2001/debian11:rust-1.85.0-slim'
# docker build --platform linux/arm64 -f Dockerfile . -t 'chunhui2001/debian11:rust-1.85.0-slim'
# docker run -dit --platform linux/amd64 --entrypoint="top" -P --name rust1.85 chunhui2001/debian11:rust-1.85.0-slim
# docker run -dit -p 8080:8080 --name rust1.78 chunhui2001/debian11:rust-1.85.0-slim
# docker push chunhui2001/debian11:rust-1.85.0-slim
# docker pull chunhui2001/debian11:rust-1.85.0-slim

# Open ports
EXPOSE 8000
