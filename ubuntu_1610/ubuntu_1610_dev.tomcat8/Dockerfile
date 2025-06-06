# chunhui2001/ubuntu_1610_dev:tomcat8
# Version 0.0.1
FROM chunhui2001/ubuntu_1610_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV JAVA_HOME=/usr/local/java
WORKDIR /usr/local

# Download and extract files
RUN wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-8/v8.5.39/bin/apache-tomcat-8.5.39.tar.gz && tar -zxf apache-tomcat-8.5.39.tar.gz -C /usr/local/ && mv apache-tomcat-8.5.39 tomcat
RUN wget http://archive.apache.org/dist/apr/apr-1.6.3.tar.gz && tar -zxf apr-1.6.3.tar.gz -C /usr/local/
RUN wget http://archive.apache.org/dist/tomcat/tomcat-connectors/native/1.2.14/source/tomcat-native-1.2.14-src.tar.gz && tar -zxf tomcat-native-1.2.14-src.tar.gz -C /usr/local/

# Add tomcat group and tomcat user
RUN groupadd tomcat && chown -R root:root /usr/local/tomcat 
RUN useradd -s /bin/false -g tomcat -d /usr/local/tomcat tomcat

## Tomcat APR
WORKDIR /usr/local/apr-1.6.3
RUN apt-get install -y libtool make
RUN sed -i "s#\$RM[[:space:]]*\"\$cfgfile\"#\#\$RM \"\$cfgfile\"#g" /usr/local/apr-1.6.3/configure
RUN ./configure 
RUN make && make install 

## Tomcat native
WORKDIR /usr/local/tomcat-native-1.2.14-src/native
RUN ./configure --with-apr=/usr/local/apr && make && make install 

# set environments
ENV CATALINA_BASE=/usr/local/tomcat
ENV CATALINA_HOME=/usr/local/tomcat
ENV JAVA_OPTS="-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
#ENV CATALINA_OPTS="-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
ENV CATALINA_PID=/usr/local/tomcat/temp/tomcat.pid
ENV LD_LIBRARY_PATH='$LD_LIBRARY_PATH:/usr/local/apr/lib'

# set perimisions
WORKDIR /usr/local/tomcat
RUN chgrp -R tomcat conf && chmod g+rwx conf && chmod g+r conf/* && chown -R tomcat work/ temp/ logs/

# remove files
RUN rm -rf /usr/local/apache-tomcat-8.5.39.tar.gz 
RUN rm -rf /usr/local/apr-1.6.3*
RUN rm -rf /usr/local/tomcat-native-1.2.14-src*

WORKDIR /usr/local/tomcat/webapps
VOLUME ["/usr/local/tomcat/webapps/ROOT", "/usr/local/tomcat/logs"]

RUN sed -i "s#SSLEngine=\"on\"#SSLEngine=\"off\"#g" /usr/local/tomcat/conf/server.xml

# start tomcat
#ENTRYPOINT ["/usr/local/tomcat/bin/startup.sh"]
ENTRYPOINT ["/usr/local/tomcat/bin/catalina.sh", "run"]

# docker run -d -p 8181:8080 -v /Users/keesh/workspace/mylab2013/war/:/usr/local/tomcat/webapps/ROOT:ro --name mylab2013 chunhui2001/ubuntu_1610_dev:tomcat8

# Open ports
EXPOSE 8080
