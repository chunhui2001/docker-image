# chunhui2001/centos_7_dev:java8
# Version 0.0.1
FROM chunhui2001/centos_7_dev:basic 
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# download files
WORKDIR /usr/local
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F;oraclelicense=accept-securebackup-cookie" \
         http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.rpm

# Install
RUN rpm -Uvh jdk-8u161-linux-x64.rpm

RUN alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 1 
RUN alternatives --install /usr/bin/java java /usr/java/latest/bin/java 1 
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 1
RUN alternatives --install /usr/bin/javah javah /usr/java/latest/bin/javah 1
RUN alternatives --install /usr/bin/jps jps /usr/java/latest/bin/jps 1
RUN alternatives --install /usr/bin/jar jar /usr/java/latest/bin/jar 1

#RUN alternatives --config java

# export JAVA_HOME=/usr/local/java
# export M2_HOME=/usr/local/maven
# export ANT_HOME=/usr/local/ant
# export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
# export PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin

# remove files
RUN rm /usr/local/jdk-8u161-linux-x64.rpm

# reset dir
WORKDIR /root/app


ENTRYPOINT []
CMD ["/bin/bash"]


# Open ports
EXPOSE 8081
