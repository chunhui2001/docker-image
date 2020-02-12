# chunhui2001/ubuntu_20.04_dev:protobuf
# Version 0.0.1
FROM chunhui2001/ubuntu_20.04_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

RUN copy protobuf /root/
RUN apt-get install -y autoconf automake libtool curl make g++ unzip
WORKDIR /root/protobuf
RUN ./autogen.sh && ./configure && make && make install && ldconfig

### 查看版本
# protoc --version



# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:protobuf'
# docker run -dit --entrypoint="top" --name ubuntu20.04-protobuf chunhui2001/ubuntu_20.04_dev:protobuf
# docker push chunhui2001/ubuntu_20.04_dev:protobuf
# docker pull chunhui2001/ubuntu_20.04_dev:protobuf

# Open ports
EXPOSE 8090
