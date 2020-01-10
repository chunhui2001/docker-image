# chunhui2001/ubuntu_1804:thrift
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# Pick boost_1_60_0.tar.gz and thrift-0.12.0.tar.gz from chunhui2001/clouddisk:linux
ADD ./boost_1_60_0.tar.gz /usr/local/
ADD ./thrift-0.12.0.tar.gz /usr/local/

RUN apt-get update -y && apt-get install -y automake bison flex g++ git libboost-all-dev libevent-dev libssl-dev libtool make pkg-config

WORKDIR /usr/local/boost_1_60_0
RUN ./bootstrap.sh
RUN ./b2 install

WORKDIR /usr/local/thrift-0.12.0
RUN ./bootstrap.sh
RUN ./configure --with-boost=/usr/local --enable-libtool-lock
RUN make
#RUN make check
#RUN sh test/test.sh
RUN make install

# check thrift was installed successful
# /usr/local/bin/thrift -version 
# That's it. (The Thrife will be installed /usr/local/bin/thrift)


# 安装 Thrift, 得到 ${thrift.executable.path}
# http://www.apache.org/dyn/closer.cgi?path=/thrift/0.12.0/thrift-0.12.0.tar.gz
# https://thrift.apache.org/docs/install/debian
# https://thrift.apache.org/docs/BuildingFromSource
# wget http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.gz   

# 如果输入 thrift -version，提示说 thrift-compiler 没有安装, 则:
# $ apt-get install thrift-compiler



# docker build . -t 'chunhui2001/ubuntu_1804:thrift'
# docker run -dit --entrypoint="top" --name thrift chunhui2001/ubuntu_1804:thrift
# docker push chunhui2001/ubuntu_1804:thrift
# docker pull chunhui2001/ubuntu_1804:thrift

#CMD ["/etc/entrypoint.sh"]

#EXPOSE 80