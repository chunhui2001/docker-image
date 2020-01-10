# chunhui2001/ubuntu_1804:hadoop_2.6.0_compile
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

RUN apt-get update -y && apt-get -y install netcat-traditional libssl-dev build-essential pkgconf cmake libprotobuf-dev protobuf-compiler ruby libtool m4 autoconf automake libglib2.0-dev libffi-dev
RUN apt-get install -y autoconf automake libtool cmake zlib1g-dev pkg-config libssl-dev libfuse-dev cmake zlib1g-dev libsnappy-dev  bzip2 libbz2-dev libjansson-dev libncurses5-dev
RUN apt-get install -y pkgconf

# RUN rm /usr/bin/gcc && ln -s /usr/bin/gcc-4.8 /usr/bin/gcc

# cmake -version
# autoconf -V
# cmake -version
# openssl version
# gcc --version
# protoc --version  编译 hadoop 2.6.0 需要特定版本的 protobuf, expected version is '2.5.0'

ADD ./ActivePerl-5.24.2.2403-x86_64-linux-glibc-2.15-403863.tar.gz /usr/local/
ADD ./glibc-2.9.tar.bz2 /usr/local
ADD ./glibc-linuxthreads-2.5.tar.bz2 /usr/local/glibc-2.9
ADD ./findbugs-3.0.1.tar.gz /usr/local/
ADD ./hadoop-2.6.0-src.tar.gz /usr/local/
ADD ./protobuf-2.5.0.tar.gz /usr/local/

RUN ln -s /usr/local/findbugs-3.0.1 /usr/local/findbugs
RUN ln -s /usr/local/ActivePerl* /usr/local/ActivePerl

ENV FINDBUGS_HOME=/usr/local/findbugs

WORKDIR /usr/local/protobuf-2.5.0
RUN libtoolize --force
RUN ./autogen.sh
RUN ./configure --prefix=/usr/local
RUN make
RUN make install
RUN ldconfig

WORKDIR /usr/local/ActivePerl
#RUN sh install.sh

ENV CFLAGS="-g -O2"
WORKDIR /usr/local/glibc-2.9
# RUN ./glibc-2.9/configure && make && make install 

WORKDIR /usr/local/hadoop-2.6.0-src
#RUN mvn package -Pdist,native -DskipTests -Dtar -Dmaven.javadoc.skip=true -Drequire.snappy -Drequire.openssl

# It will build package and resulting distribuition is stored in - 
# hadoop-dist/target/ directory

# docker build . -t 'chunhui2001/ubuntu_1804:hadoop_2.6.0_compile'
# docker run -dit --entrypoint="top" --name hadoop_2.6.0_compile chunhui2001/ubuntu_1804:hadoop_2.6.0_compile
# docker push chunhui2001/ubuntu_1804:hadoop_2.6.0_compile
# docker pull chunhui2001/ubuntu_1804:hadoop_2.6.0_compile

#CMD ["top"]

EXPOSE 9000 16010