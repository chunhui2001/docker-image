# chunhui2001/ubuntu_20.04_dev:zh-CN
# Version 0.0.1
FROM ubuntu:20.04
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version
# uname -a

### Install dev tools
RUN apt-get update -y
RUN apt-get install -y vim build-essential lsb-release net-tools iputils-ping apt-utils wget ttf-wqy-microhei locales iproute2
# 清理无用的包
RUN apt-get clean && apt-get autoclean
# 检查是否有损坏的依赖
RUN apt-get check

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

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:zh-CN'
# docker run -dit --entrypoint="top" -P --name ubuntu20.04 chunhui2001/ubuntu_20.04_dev:zh-CN
# docker run -dit -p 8080:8080 --name ubuntu20.04 chunhui2001/ubuntu_20.04_dev:zh-CN
# docker push chunhui2001/ubuntu_20.04_dev:zh-CN
# docker pull chunhui2001/ubuntu_20.04_dev:zh-CN

# Open ports
# EXPOSE 80
