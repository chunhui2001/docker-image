# chunhui2001/centos_66_dev:hadoop_2.4.0_cluster
# Version 0.0.1
FROM chunhui2001/centos_66_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ADD ./hadoop-2.4.0.tar.gz /usr/local/
ADD ./hadoop-native.2.4.0.tar /usr/local/

RUN ln -s /usr/local/hadoop-2.4.0 /usr/local/hadoop
RUN tar -cvf /usr/local/hadoop/lib/native_bakup.tar.gz /usr/local/hadoop/lib/native
RUN rsync /usr/local/native/* /usr/local/hadoop/lib/native/

RUN rpm --rebuilddb && yum install -y cmake zlib-devel openssl-devel snappy-devel bzip2 bzip2-devel ncurses-devel xz-devel kernel-devel lynx openssh*

# ./hadoop checknative -a

env HADOOP_HOME=/usr/local/hadoop 
env HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop 
env HADOOP_MAPRED_HOME=$HADOOP_HOME 
env HADOOP_COMMON_HOME=$HADOOP_HOME 
env HADOOP_HDFS_HOME=$HADOOP_HOME 
env YARN_HOME=$HADOOP_HOME 
env HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native 
env JAVA_LIBRARY_PATH=${HADOOP_HOME}/lib/native 
env HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib" 
env PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin 

RUN mkdir $HADOOP_HOME/data 

# HBASE
ENV HBASE_HOME="/usr/local/hbase"
ADD ./hbase-1.1.5-bin.tar.gz /usr/local/
RUN ln -s /usr/local/hbase-1.1.5 $HBASE_HOME
RUN mv /usr/local/hbase/lib/slf4j-log4j12-1.7.5.jar /usr/local/hbase/lib/slf4j-log4j12-1.7.5.jar.bak

# docker build . -t 'chunhui2001/centos_66_dev:hadoop_2.4.0_cluster'
# docker run -dit --entrypoint="top" --name hadoop_2.4.0_cluster chunhui2001/centos_66_dev:hadoop_2.4.0_cluster
# docker push chunhui2001/centos_66_dev:hadoop_2.4.0_cluster
# docker pull chunhui2001/centos_66_dev:hadoop_2.4.0_cluster

# 修改 root 密码, 用于 ssh 免密登陆
RUN echo "root:root" | chpasswd

ADD ./data_formated.tar.f /usr/local/hadoop/
ADD ./entrypoint.sh /etc/
RUN chmod +x /etc/entrypoint.sh

## RUN useradd -ms /bin/bash developer
## RUN passwd -d developer
## RUN chown -R developer /home/developer/.bash*
## RUN echo "developer    ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

ENTRYPOINT ["/etc/entrypoint.sh"]
#CMD ["java", "-jar", "app.jar"]

# Open ports
# EXPOSE 80
