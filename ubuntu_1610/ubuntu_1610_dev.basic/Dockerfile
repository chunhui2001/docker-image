# chunhui2001/ubuntu_1610_dev:basic 
# Version 0.0.1
FROM ubuntu:16.10
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ADD sources.list /etc/apt/sources.list

# Install dev tools
RUN apt-get update 
RUN apt-get install -y vim build-essential lsb-release net-tools iputils-ping apt-utils wget makepasswd ttf-wqy-microhei

# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 开启中文支持
# RUN if [ ! -d '/var/lib/locales/supported.d/' ]; then mkdir -p /var/lib/locales/supported.d/; fi
RUN locale-gen zh_CN.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN locale-gen zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh
ENV LC_ALL zh_CN.UTF-8


# docker build . -t "chunhui2001/ubuntu_1610_dev:basic"
# docker run -it chunhui2001/ubuntu_1610_dev:basic 

# ENTRYPOINT ["/bin/bash", "-c", "while true; do echo 1 >/dev/null 2>/dev/null; sleep 1; done"]

# Open ports
# EXPOSE 80
