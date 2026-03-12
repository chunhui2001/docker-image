# chunhui2001/ubuntu_25.10:rust-1.94
# Version 0.0.1
FROM chunhui2001/ubuntu_25.10:zh-CN
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version
# uname -a

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.94.0

ENV OPENSSL_DIR=/usr
ENV OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu
ENV OPENSSL_INCLUDE_DIR=/usr/include
ENV CC=clang
ENV CXX=clang++

ENV ENV_TOOLCHAIN=1.94.0-x86_64-unknown-linux-gnu
ENV PATH="/root/.cargo/bin:$PATH"

# rustup toolchain list
RUN rustup default 1.94.0-x86_64-unknown-linux-gnu
RUN adduser --disabled-password --gecos '' rurst
RUN adduser rurst sudo

WORKDIR /root

# docker build --platform linux/amd64 -f Dockerfile . -t 'chunhui2001/ubuntu_25.10:rust-1.94'
# docker run --platform linux/amd64 -dit --entrypoint="top" -P --name rust-1.94 chunhui2001/ubuntu_25.10:rust-1.94
# docker run -dit -p 8080:8080 --name rust-1.94 chunhui2001/ubuntu_25.10:rust-1.94
# docker push chunhui2001/ubuntu_25.10:rust-1.94
# docker pull chunhui2001/ubuntu_25.10:rust-1.94

# Open ports
# EXPOSE 80



