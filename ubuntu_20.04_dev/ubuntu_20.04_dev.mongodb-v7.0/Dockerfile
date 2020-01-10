# chunhui2001/ubuntu_20.04_dev:mongodb-v7.0
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
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl git pkg-config libssl-dev clang nettle-dev cmake libsasl2-dev binutils libvips-dev fakeroot libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev libzstd-dev devscripts debhelper g++ exiftool
RUN apt-get clean && apt-get autoclean

RUN apt-get install gnupg curl -y
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list
RUN apt-get update -y && apt-get install -y mongodb-org

### 查看 mongo 版本
# mongo -version

RUN mkdir -p /data/log && echo "" | tee /data/log/mongod.log
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
WORKDIR /root

VOLUME /data/db
VOLUME /data/log

ENTRYPOINT [ "entrypoint.sh" ]
#CMD [ "mongod", "--bind_ip", "0.0.0.0" ]

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:mongodb-v7.0'
# docker run --platform linux/amd64 -dit --entrypoint="top" -P --name mongodb-v7.0 chunhui2001/ubuntu_20.04_dev:mongodb-v7.0
# docker run -dit -p 4222:4222 --name mongodb-v7.0 chunhui2001/ubuntu_20.04_dev:mongodb-v7.0
# docker push chunhui2001/ubuntu_20.04_dev:mongodb-v7.0
# docker pull chunhui2001/ubuntu_20.04_dev:mongodb-v7.0

# Open ports
# EXPOSE 80



