# chunhui2001/ubuntu_1804:pinpont_compile
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# 依赖 chunhui2001/ubuntu_1804:thrift
# Pick from chunhui2001/clouddisk:java
ADD ./pinpoint.tar /usr/local/

ADD ./jdk-6u6-p-linux-x64.tar.gz /usr/local/
ADD ./jdk-7u80-linux-x64.tar.gz /usr/local/
ADD ./jdk-9.0.4_linux-x64_bin.tar.gz /usr/local/

## 把下面的环境变量放到 /etc/profile 文件里, 并 source /etc/profile
env JAVA_HOME=/usr/local/java
env JAVA_6_HOME=/usr/local/jdk1.6.0_06
env JAVA_7_HOME=/usr/local/jdk1.7.0_80
env JAVA_8_HOME=/usr/local/jdk1.8.0_211
env JAVA_9_HOME=/usr/local/jdk-9.0.4

env PATH=$PATH:$JAVA_HOME/bin
env CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar
env PATH=$PATH:$JAVA_6_HOME/bin
env CLASSPATH=.:$JAVA_6_HOME/jre/lib:$JAVA_6_HOME/lib:$JAVA_6_HOME/lib/tools.jar
env PATH=$PATH:$JAVA_7_HOME/bin
env CLASSPATH=.:$JAVA_7_HOME/jre/lib:$JAVA_7_HOME/lib:$JAVA_7_HOME/lib/tools.jar
env PATH=$PATH:$JAVA_8_HOME/bin
env CLASSPATH=.:$JAVA_8_HOME/jre/lib:$JAVA_8_HOME/lib:$JAVA_8_HOME/lib/tools.jar
env PATH=$PATH:$JAVA_9_HOME/bin
env CLASSPATH=.:$JAVA_9_HOME/jre/lib:$JAVA_9_HOME/lib:$JAVA_9_HOME/lib/tools.jar
env PATH=/usr/local/maven/bin:$PATH

RUN apt-get install -y git 

WORKDIR /usr/local/pinpoint

# 签出代码
RUN git checkout 1.7.3


# 编译前修改 /usr/local/pinpoint/thrift/pom.xml, 更新 ${thrift.executable.path}
# ...

# 编译
# RUN ./mvnw clean install -Dmaven.test.skip=true -P with-thrift,klocwork

# https://github.com/naver/pinpoint/releases/tag/1.7.3
# Assets : 
# pinpoint-agent-1.7.3.tar.gz 		8.49 MB
# pinpoint-collector-1.7.3.war 		46.1 MB
# pinpoint-web-1.7.3.war 				75.3 MB

# docker build . -t 'chunhui2001/ubuntu_1804:pinpont_compile'
# docker run -dit --entrypoint="top" --name pinpont_compile chunhui2001/ubuntu_1804:pinpont_compile
# docker push chunhui2001/ubuntu_1804:pinpont_compile
# docker pull chunhui2001/ubuntu_1804:pinpont_compile

#CMD ["/etc/entrypoint.sh"]

#EXPOSE 80