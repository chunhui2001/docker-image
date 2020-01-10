# chunhui2001/ubuntu_20.04_dev:leveldb
# Version 0.0.1
FROM chunhui2001/ubuntu_20.04_dev:golang_1.15.7
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
RUN apt-get -y update \
    && apt-get -y install libleveldb-dev libleveldb1d libsnappy-dev wget curl build-essential cmake gcc sqlite3

# cleanup
RUN apt-get -y -qq --force-yes clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:leveldb'
# docker push chunhui2001/ubuntu_20.04_dev:leveldb
# docker pull chunhui2001/ubuntu_20.04_dev:leveldb


