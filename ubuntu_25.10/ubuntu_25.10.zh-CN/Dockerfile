# chunhui2001/ubuntu_25.10:zh-CN
FROM ubuntu:25.10
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version
# uname -a

### Install dev tools
RUN apt-get update -y
RUN apt-get install -y curl git pkg-config libssl-dev clang nettle-dev \
cmake libsasl2-dev binutils libvips-dev fakeroot \
libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev \
liblz4-dev libzstd-dev devscripts debhelper g++ \
exiftool vim build-essential lsb-release net-tools \
iputils-ping apt-utils wget fonts-wqy-microhei \
locales iproute2 && apt-get clean && apt-get autoclean

# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 开启中文支持
RUN locale-gen zh_CN.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN locale-gen zh_CN.UTF-8

ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV LC_ALL=zh_CN.UTF-8

WORKDIR /root

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_25.10:zh-CN'
# docker run -dit --entrypoint="top" -P --name ubuntu25.10 chunhui2001/ubuntu_25.10:zh-CN
# docker run -dit -p 8080:8080 --name ubuntu25.10 chunhui2001/ubuntu_25.10:zh-CN
# docker push chunhui2001/ubuntu_25.10:zh-CN
# docker pull chunhui2001/ubuntu_25.10:zh-CN

# Open ports
# EXPOSE 80
