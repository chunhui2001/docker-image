# chunhui2001/ubuntu_20.04_dev:protobuf
# Version 0.0.1
FROM chunhui2001/ubuntu_20.04_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

## https://github.com/protocolbuffers/protobuf
RUN apt-get update -y && apt-get install -y autoconf automake libtool curl make g++ unzip
COPY protobuf-master.zip /root/
RUN unzip /root/protobuf-master.zip -d /root/
WORKDIR /root/protobuf-master
RUN ./autogen.sh && ./configure && make && make install && ldconfig

### 查看版本
# protoc --version

### Protocol Buffers v2.5.0

### protobuf-c
# https://github.com/protobuf-c/protobuf-c/wiki/Examples

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:protobuf'
# docker run -dit --entrypoint="top" --name ubuntu20.04-protobuf chunhui2001/ubuntu_20.04_dev:protobuf
# docker push chunhui2001/ubuntu_20.04_dev:protobuf
# docker pull chunhui2001/ubuntu_20.04_dev:protobuf
# docker commit -a "chunhui.zhang" -m "my protobuf" 88dd00995e89  chunhui2001/ubuntu_20.04_dev:protobuf

# Open ports
EXPOSE 8090
