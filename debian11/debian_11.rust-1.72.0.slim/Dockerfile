# chunhui2001/debian11:rust-1.72.0.slim
# Version 0.0.1
FROM rust:1.72.0-slim
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version 
# uname -a

### Install dev tools
RUN apt-get -qq update -y &&\
 apt-get install -y vim build-essential lsb-release net-tools iputils-ping wget ttf-wqy-microhei locales iproute2 lld clang &&\
 apt-get -y install apt-transport-https ca-certificates curl software-properties-common autoconf libssl-dev musl-tools libudev-dev librust-openssl-sys-dev libcurl4-gnutls-dev zlib1g zlib1g-dev libxml2 libxml2-dev libxslt-dev\
 libreadline6-dev libpcre3 libpcre3-dev libssl-dev openssl pkg-config libperl-dev libgd-dev libgeoip-dev libpam-dev libatomic-ops-dev lua5.1 liblua5.1-0 liblua5.1-0-dev &&\
 ln -s /usr/include/x86_64-linux-gnu/asm /usr/include/x86_64-linux-musl/asm && ln -s /usr/include/asm-generic /usr/include/x86_64-linux-musl/asm-generic && ln -s /usr/include/linux /usr/include/x86_64-linux-musl/linux &&\
 mkdir /musl && cd /musl && wget https://github.com/openssl/openssl/archive/OpenSSL_1_1_1f.tar.gz && tar zxvf OpenSSL_1_1_1f.tar.gz && cd openssl-OpenSSL_1_1_1f/ &&\
 ldconfig && CC="musl-gcc -fPIE -pie" ./Configure no-shared no-async no-engine -DOPENSSL_NO_SECURE_MEMORY --prefix=/musl --openssldir=/musl/ssl linux-x86_64 && make depend && make -j$(nproc) && make install &&\
 apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* && rm -rf /musl/OpenSSL_1_1_1f.tar.gz && rm -rf /musl/OpenSSL_1_1_1f &&\
 apt clean autoclean && apt --purge autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log} &&\
 cd /root

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

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh
ENV LC_ALL zh_CN.UTF-8

#RUN localedef -v -c -i zh_CN -f UTF-8 zh_CN.UTF-8
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && rustup target add x86_64-unknown-linux-musl

WORKDIR /root

# rustup target list
# rustup default
# rustc --version  > rustc 1.72.0 (69f9c33d7 2022-12-12)
# cargo --list
# openssl version  > OpenSSL 3.0.7 1 Nov 2022 (Library: OpenSSL 3.0.7 1 Nov 2022)
# openssl version -a

# docker build -f Dockerfile . -t 'chunhui2001/debian11:rust-1.72.0.slim'
# docker run -dit -P --name rust1.72 chunhui2001/debian11:rust-1.72.0.slim /bin/bash -c "while true; do echo 1 >/dev/null 2>/dev/null; sleep 1; done"
# docker run -dit -p 8080:8080 --name rust1.72 chunhui2001/debian11:rust-1.72.0.slim
# docker push chunhui2001/debian11:rust-1.72.0.slim
# docker pull chunhui2001/debian11:rust-1.72.0.slim

# Open ports
EXPOSE 8000
