# chunhui2001/ubuntu_1804_dev:java12
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:zh-CN 
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ADD jdk-12.0.2_linux-x64_bin.tar.gz /usr/local/
ADD apache-ant-1.10.5-bin.tar.gz /usr/local/
ADD apache-maven-3.6.1-bin.tar.gz /usr/local/

RUN ln -s /usr/local/jdk-12.0.2 /usr/local/java
RUN ln -s /usr/local/apache-ant-1.10.5 /usr/local/ant
RUN ln -s /usr/local/apache-maven-3.6.1 /usr/local/maven

# execute update-alternatives to use java 12
RUN update-alternatives --install /usr/bin/java java /usr/local/java/bin/java 300
RUN update-alternatives --install /usr/bin/javac javac /usr/local/java/bin/javac 300
RUN update-alternatives --install /usr/bin/jar jar /usr/local/java/bin/jar 300
#RUN update-alternatives --install /usr/bin/javah javah /usr/local/java/bin/javah 300
RUN update-alternatives --install /usr/bin/jps jps /usr/local/java/bin/jps 300
#RUN update-alternatives --config java 

ENV JAVA_HOME=/usr/local/java
ENV M2_HOME=/usr/local/maven
ENV ANT_HOME=/usr/local/ant
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin

# docker build . -t "chunhui2001/ubuntu_1804_dev:java12"
# docker run -dit --entrypoint="top" -P --name java12 chunhui2001/ubuntu_1804_dev:java12

# Open ports
# EXPOSE 8081


# ZGC
# https://blog.csdn.net/Aria_Miazzy/article/details/86593684
# 一语道破Java 11的ZGC为何如此高效
# https://www.cnblogs.com/Ti1077/p/9626861.html
# -server -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -Xlog:age*,gc*=info:file=gc-%t.log:time,tid,tags:filecount=3,filesize=20m -Djava.io.tmpdir=/tmp

