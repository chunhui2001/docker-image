# chunhui2001/ubuntu_1804_dev:zh-CN 
# Version 0.0.1
FROM ubuntu:18.04
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# Install dev tools
RUN apt-get update 
RUN apt-get install -y vim build-essential lsb-release net-tools iputils-ping apt-utils wget ttf-wqy-microhei locales iproute2

# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 开启中文支持
RUN locale-gen zh_CN.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN locale-gen zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh
ENV LC_ALL zh_CN.UTF-8

WORKDIR /root


# Open ports
# EXPOSE 80
