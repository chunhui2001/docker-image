# chunhui2001/ubuntu_20.04_dev:rust-1.93
# Version 0.0.1
FROM chunhui2001/ubuntu_20.04_dev:zh-CN
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version
# uname -a

### Install dev tools
RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl git pkg-config libssl-dev clang nettle-dev cmake libsasl2-dev binutils libvips-dev fakeroot libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev libzstd-dev devscripts debhelper g++ exiftool
RUN apt-get clean && apt-get autoclean

### check openssl version
# openssl version -a
# OpenSSL 1.1.1d  10 Sep 2019 (Library: OpenSSL 1.1.1f  31 Mar 2020)

### 验证系统 vips 版本
# vips --version

### 验证 pkg-config
# pkg-config --cflags --libs vips

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.93.1

ENV OPENSSL_DIR=/usr
ENV OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu
ENV OPENSSL_INCLUDE_DIR=/usr/include
ENV CC=clang
ENV CXX=clang++

ENV ENV_TOOLCHAIN=1.93.1-x86_64-unknown-linux-gnu
ENV PATH="/root/.cargo/bin:$PATH"

# rustup toolchain list
RUN rustup default 1.93.1-x86_64-unknown-linux-gnu
RUN adduser --disabled-password --gecos '' rurst
RUN adduser rurst sudo

WORKDIR /root

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:rust-1.93'
# docker run --platform linux/amd64 -dit --entrypoint="top" -P --name rust-1.93 chunhui2001/ubuntu_20.04_dev:rust-1.93
# docker run -dit -p 8080:8080 --name rust-1.93 chunhui2001/ubuntu_20.04_dev:rust-1.93
# docker push chunhui2001/ubuntu_20.04_dev:rust-1.93
# docker pull chunhui2001/ubuntu_20.04_dev:rust-1.93

# Open ports
# EXPOSE 80



