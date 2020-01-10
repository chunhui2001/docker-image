# chunhui2001/ubuntu_1804_dev:java13
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:zh-CN 
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# wget --no-cookies --no-check-certificate --header \
# "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
# "https://download.oracle.com/otn-pub/java/jdk/13.0.2+8/d4173c853231432d94f001e99d882ca7/jdk-13.0.2_linux-x64_bin.tar.gz"

ADD jdk-13.0.2_linux-x64_bin.tar.gz /usr/local/
ADD apache-ant-1.10.5-bin.tar.gz /usr/local/
ADD apache-maven-3.6.1-bin.tar.gz /usr/local/

RUN ln -s /usr/local/jdk-13.0.2 /usr/local/java
RUN ln -s /usr/local/apache-ant-1.10.5 /usr/local/ant
RUN ln -s /usr/local/apache-maven-3.6.1 /usr/local/maven

# execute update-alternatives to use java 13
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


# docker build . -t "chunhui2001/ubuntu_1804_dev:java13"
# docker run -dit --entrypoint="top" -P --name java13 chunhui2001/ubuntu_1804_dev:java13

# Open ports
# EXPOSE 8081


