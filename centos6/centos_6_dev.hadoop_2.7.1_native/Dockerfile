# chunhui2001/centos_6_dev:hadoop_2.7.1_native
# Version 0.0.1
FROM chunhui2001/centos_6_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# autoconf -V
# cmake -version
# openssl version
# gcc --version
# protoc --version  编译 hadoop 2.6.0 需要特定版本的 protobuf, expected version is '2.5.0'

ADD ./findbugs-3.0.1.tar.gz /usr/local/
ADD ./hadoop-2.7.1-src.tar.gz /usr/local/
ADD ./protobuf-2.5.0.tar.gz /usr/local/

RUN ln -s /usr/local/findbugs-3.0.1 /usr/local/findbugs

ENV FINDBUGS_HOME=/usr/local/findbugs

WORKDIR /usr/local/protobuf-2.5.0
RUN libtoolize --force
RUN ./autogen.sh
RUN ./configure --prefix=/usr/local
RUN make
RUN make install
RUN ldconfig

RUN yum install -y cmake zlib-devel openssl-devel snappy-devel bzip2 bzip2-devel ncurses-devel xz-devel
RUN yum install -y kernel-devel vi git lynx

WORKDIR /usr/local/hadoop-2.7.1-src
#RUN mvn package -Pdist,native -DskipTests -Dtar -Dmaven.javadoc.skip=true -Drequire.snappy -Drequire.openssl

# It will build package and resulting distribuition is stored in - 
# hadoop-dist/target/ directory

# 检查是否有本地包
# hadoop checknative -a

# docker build . -t 'chunhui2001/centos_6_dev:hadoop_2.7.1_native'
# docker run -dit --entrypoint="top" --name hadoop_2.7.1_compile chunhui2001/centos_6_dev:hadoop_2.7.1_native
# docker push chunhui2001/centos_6_dev:hadoop_2.7.1_native
# docker pull chunhui2001/centos_6_dev:hadoop_2.7.1_native

#CMD ["top"]

# Open ports
# EXPOSE 8081

