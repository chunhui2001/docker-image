# chunhui2001/debian11:rust-1.66.0.slim
# Version 0.0.1
FROM rust:1.66.0-slim
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version 
# uname -a

### Install dev tools
RUN apt-get -qq update -y &&\
 apt-get install -y vim build-essential lsb-release net-tools iputils-ping wget ttf-wqy-microhei locales iproute2 &&\
 apt-get -y install apt-transport-https ca-certificates curl software-properties-common autoconf libssl-dev libcurl4-gnutls-dev zlib1g zlib1g-dev libxml2 libxml2-dev libxslt-dev\
 libreadline6-dev libpcre3 libpcre3-dev libssl-dev openssl libssl-dev libperl-dev libgd-dev libgeoip-dev libpam-dev libatomic-ops-dev lua5.1 liblua5.1-0 liblua5.1-0-dev &&\
 curl -L "https://www.openssl.org/source/openssl-3.0.7.tar.gz" > /usr/src/openssl-3.0.7.tar.gz && cd /usr/src && tar -zxvf openssl-3.0.7.tar.gz &&\
 cd openssl-3.0.7 && ./config && make && make install && ldconfig && ldconfig /usr/local/lib64 && mv /usr/bin/openssl /usr/bin/openssl.bak &&\
 ln -s /usr/local/bin/openssl /usr/bin/openssl &&\
 apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* && rm -rf /usr/src/openssl-3.0.7.tar.gz && rm -rf /usr/src/openssl-3.0.7 &&\
 cd /root

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
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8

WORKDIR /root

# rustup target list
# rustup default
# rustc --version  > rustc 1.66.0 (69f9c33d7 2022-12-12)
# cargo --list
# openssl version  > OpenSSL 3.0.7 1 Nov 2022 (Library: OpenSSL 3.0.7 1 Nov 2022)
# openssl version -a

# docker build -f Dockerfile . -t 'chunhui2001/debian11:rust-1.66.0.slim'
# docker run -dit --entrypoint="top" -P --name rust1.66 chunhui2001/debian11:rust-1.66.0.slim
# docker run -dit -p 8080:8080 --name rust1.66 chunhui2001/debian11:rust-1.66.0.slim
# docker push chunhui2001/debian11:rust-1.66.0.slim
# docker pull chunhui2001/debian11:rust-1.66.0.slim

# Open ports
EXPOSE 8000
