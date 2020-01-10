# chunhui2001/ubuntu_1404_dev:zh-CN 
# Version 0.0.1
FROM ubuntu:14.04
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# Install dev tools
RUN apt-get update -y
RUN apt-get install -y vim build-essential lsb-release net-tools iputils-ping apt-utils wget ttf-wqy-microhei locales netcat-traditional vim

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


# docker build . -t 'chunhui2001/ubuntu_1404_dev:zh-CN'
# docker run -dit --entrypoint="top" --name ubuntu_1404 chunhui2001/ubuntu_1404_dev:zh-CN
# docker push chunhui2001/ubuntu_1404_dev:zh-CN
# docker pull chunhui2001/ubuntu_1404_dev:zh-CN

# 镜像瘦身, https://github.com/jwilder/docker-squash
# docker-squash
# $ docker save <image id> -o image.tar
# $ sudo docker-squash -i image.tar -o squashed.tar
# $ cat squashed.tar | docker load
# $ docker images <new image id>
# one line:
# $ docker save <image id> | sudo /usr/local/docker-squash -t chunhui2001/ubuntu_1404_dev:zh-CN.1 | docker load

# Open ports
# EXPOSE 80