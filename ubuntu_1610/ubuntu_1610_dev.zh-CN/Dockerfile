# chunhui2001/ubuntu_1610_dev:zh-CN
# Version 0.0.1
FROM ubuntu:16.10
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

## 
#RUN sed -i -e"s/old-releases.ubuntu.com/archive.ubuntu.com/" /etc/apt/sources.list
ADD sources.list /etc/apt/sources.list


# Install dev tools
# RUN apt-get update && apt-get install -yqq wget vim apt-utils net-tools iputils-ping
RUN apt-get update && apt-get install -y wget vim apt-utils net-tools iputils-ping ttf-wqy-microhei
RUN apt-get install -y vim build-essential lsb-release net-tools iputils-ping apt-utils wget makepasswd ttf-wqy-microhei

# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 开启中文支持
# RUN if [ ! -d '/var/lib/locales/supported.d/' ]; then mkdir -p /var/lib/locales/supported.d/; fi
RUN locale-gen zh_CN.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN locale-gen zh_CN.UTF-8
ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV LC_ALL=zh_CN.UTF-8

# alias
RUN echo "alias 'll=ls -al'" >> /root/.bashrc && echo "alias 'lll=ls -lh'" >> /root/.bashrc 

ARG APP_NAME='app'
ENV APP_NAME=$APP_NAME

WORKDIR /root/project

# 启动一个一直运行的容器
# $ docker run -dit -v /Users/keesh/Desktop/c_projct:/root/project[:ro 只读权限] --name devlab chunhui2001/ubuntu_1610_dev:zh-CN /bin/bash

# Open ports
# EXPOSE 80
