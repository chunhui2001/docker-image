# chunhui2001/ubuntu_20.04_dev:rust-1.85
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
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl git pkg-config libssl-dev clang nettle-dev cmake
RUN apt-get install -y libsasl2-dev binutils
RUN apt-get clean && apt-get autoclean

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.85.0

ENV OPENSSL_DIR=/usr
ENV OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu
ENV OPENSSL_INCLUDE_DIR=/usr/include

ENV CC=clang
ENV CXX=clang++

ENV PATH="/root/.cargo/bin:$PATH"

RUN adduser --disabled-password --gecos '' rurst
RUN adduser rurst sudo

WORKDIR /root

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:rust-1.85'
# docker run --platform linux/amd64 -dit --entrypoint="top" -P --name rust-1.85 chunhui2001/ubuntu_20.04_dev:rust-1.85
# docker run -dit -p 8080:8080 --name rust-1.85 chunhui2001/ubuntu_20.04_dev:rust-1.85
# docker push chunhui2001/ubuntu_20.04_dev:rust-1.85
# docker pull chunhui2001/ubuntu_20.04_dev:rust-1.85

# Open ports
# EXPOSE 80
