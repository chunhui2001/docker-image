# chunhui2001/ubuntu_20.04_dev:nodejs
# Version 0.0.1
FROM chunhui2001/ubuntu_20.04_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV REFRESHED_AT 2022-05-14

ARG NODE_VERSION=v16.15.0

ENV REFRESHED_AT 2017-11-03
ENV NODE_VERSION $NODE_VERSION

## install compile tools
RUN apt-get update -y && apt-get install -y cmake build-essential fontconfig

## Download files and extract
WORKDIR /usr/local
RUN wget https://nodejs.org/download/release/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.gz && tar -zxf node-$NODE_VERSION-linux-x64.tar.gz
RUN ln -s /usr/local/node-$NODE_VERSION-linux-x64 /usr/local/node && \
	ln -s /usr/local/node/bin/node /usr/sbin/node && \
	ln -s /usr/local/node/bin/npm /usr/sbin/npm

## npm config
RUN npm config set user 0
RUN npm config set unsafe-perm true
RUN npm config set prefix /usr/local
RUN npm install -g sm
RUN npm install -g --unsafe-perm node-gyp
RUN npm install -g gulp gulp-cli truffle
RUN ln -s /usr/local/bin/gulp /usr/sbin/gulp

# gulp -v
# node -v
# npm -v
# triffle --version

WORKDIR /root

## Clear files
RUN rm -rf /usr/local/*.tar.*


# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:nodejs'
# docker run -dit --entrypoint="top" --name nodejs chunhui2001/ubuntu_20.04_dev:nodejs
# docker push chunhui2001/ubuntu_20.04_dev:nodejs
# docker pull chunhui2001/ubuntu_20.04_dev:nodejs





