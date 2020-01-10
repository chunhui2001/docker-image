# chunhui2001/ubuntu_1804.mycat
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:java8
MAINTAINER Chunhui.Zhang <chunhui2001@gmail.com>

# /usr/local/mycat/
ADD ./Mycat-server-1.6.7.3-release-20190809210613-linux.tar.gz /usr/local/


ENV MYCAT_HOME=/usr/local/mycat
ENV PATH=$PATH:$JAVA_HOME/bin:$MYCAT_HOME/bin

# docker build . -t 'chunhui2001/ubuntu_1804:mycat-1.6.7.3'
# docker run -dit --entrypoint="top" --name mycat chunhui2001/ubuntu_1804:mycat-1.6.7.3

# Open ports
EXPOSE 3316


