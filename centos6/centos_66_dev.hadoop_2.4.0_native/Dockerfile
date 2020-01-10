# chunhui2001/centos_66_dev:hadoop_2.4.0_native
# Version 0.0.1
FROM chunhui2001/centos_66_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# jdk-7u71-linux-x64.tar.gz
# apache-maven-3.0.5-bin.tar.gz
# apache-ant-1.9.4-bin.tar.gz
# protobuf-2.5.0.tar.gz
# hadoop-2.4.0-src.tar.gz

# autoconf -V
# cmake -version
# openssl version
# gcc --version
# protoc --version  编译 hadoop 2.6.0 需要特定版本的 protobuf, expected version is '2.5.0'

RUN yum install -y cmake zlib-devel openssl-devel snappy-devel bzip2 bzip2-devel ncurses-devel xz-devel kernel-devel lynx

# mvn package -Pdist,native -DskipTests -Dtar -Dmaven.javadoc.skip=true -Drequire.snappy -Drequire.openssl
# mvn package -Pdist -DskipTests -Dtar -Dmaven.javadoc.skip=true -Drequire.snappy -Drequire.openssl

# It will build package and resulting distribuition is stored in - 
# hadoop-dist/target/ directory


# cd /usr/local/hadoop_src/hadoop-2.4.0-src/hadoop-dist/target/hadoop-2.4.0/lib/
# tar -cf hadoop-native.2.4.0.tar native
# cp hadoop-native.2.4.0.tar /usr/lib/hadoop/lib/
# cd /usr/lib/hadoop/lib/
# tar -cvf native_ORIGINAL.tar.gz native
# rm -rf native
# tar -xf hadoop-native.2.4.0.tar

# hadoop-native.2.4.0.tar 

# 替换默认 lib 文件
# cp -rf ./native/* ~/hadoop/lib/.

# 检查是否有本地包
# hadoop checknative -a

# docker build . -t 'chunhui2001/centos_66_dev:hadoop_2.4.0_native'
# docker run -dit --entrypoint="top" --name centos_66 chunhui2001/centos_66_dev:hadoop_2.4.0_native
# docker push chunhui2001/centos_66_dev:hadoop_2.4.0_native
# docker pull chunhui2001/centos_66_dev:hadoop_2.4.0_native

# Open ports
# EXPOSE 80