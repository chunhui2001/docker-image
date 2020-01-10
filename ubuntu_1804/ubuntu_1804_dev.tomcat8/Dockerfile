# chunhui2001/ubuntu_1804_dev:tomcat8
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# http://apr.apache.org/download.cgi
# Pick from chunhui2001/clouddisk:java
ADD ./apache-tomcat-8.5.45.tar.gz /usr/local/
ADD ./apr-1.7.0.tar.gz /usr/local/
ADD ./apr-util-1.6.1.tar.gz /usr/local/
ADD ./apr-iconv-1.2.2.tar.gz /usr/local/
ADD ./tomcat-native-1.2.23-src.tar.gz /usr/local/

RUN ln -s /usr/local/apache-tomcat-8.5.45 /usr/local/tomcat
RUN ln -s /usr/local/apr-1.7.0 /usr/local/apr-src
RUN ln -s /usr/local/apr-util-1.6.1 /usr/local/apr-util
RUN ln -s /usr/local/apr-iconv-1.2.2 /usr/local/apr-iconv-src
RUN ln -s /usr/local/tomcat-native-1.2.23-src /usr/local/tomcat-native-src

# Add tomcat group and tomcat user
RUN groupadd tomcat && chown -R root:root /usr/local/tomcat 
RUN useradd -s /bin/false -g tomcat -d /usr/local/tomcat tomcat

RUN apt-get install -y libtool make libexpat1-dev

## Tomcat APR
WORKDIR /usr/local/apr-src
# cfgfile=${ofile}T
# trap "$RM \"$cfgfile\"; exit 1" 1 2 15
# #$RM "$cfgfile"   sed 这行注释掉

RUN sed -i "s#\$RM[[:space:]]*\"\$cfgfile\"#\#\$RM \"\$cfgfile\"#g" /usr/local/apr-src/configure
RUN ./configure 
RUN make && make install 

## Tomcat APR-ICONV
WORKDIR /usr/local/apr-iconv-src
RUN ./configure --prefix=/usr/local/apr-iconv --with-apr=/usr/local/apr
RUN make && make install

## Tomcat APR-UTIL
WORKDIR /usr/local/apr-util
RUN ln -s /usr/local/apr-iconv ./apr-iconv
RUN ln -s /usr/local/apr-iconv-src ./apr-iconv-src
RUN ./configure --with-apr=/usr/local/apr --with-apr-iconv=./apr-iconv-src
RUN make && make install

## Tomcat native
WORKDIR /usr/local/tomcat-native-src/native
RUN ./configure --with-apr=/usr/local/apr && make && make install 

# set environments
ENV JAVA_HOME=/usr/local/java
ENV CATALINA_BASE=/usr/local/tomcat
ENV CATALINA_HOME=/usr/local/tomcat
ENV JAVA_OPTS="-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
#ENV CATALINA_OPTS="-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
ENV CATALINA_PID=/usr/local/tomcat/temp/tomcat.pid
ENV LD_LIBRARY_PATH='$LD_LIBRARY_PATH:/usr/local/apr/lib'

# set perimisions
WORKDIR /usr/local/tomcat
RUN chgrp -R tomcat conf && chmod g+rwx conf && chmod g+r conf/* && chown -R tomcat work/ temp/ logs/

WORKDIR /usr/local/tomcat/webapps
VOLUME ["/usr/local/tomcat/webapps/ROOT", "/usr/local/tomcat/logs"]

## RUN sed -i "s#SSLEngine=\"on\"#SSLEngine=\"off\"#g" /usr/local/tomcat/conf/server.xml
RUN cp /usr/local/tomcat/conf/server.xml /usr/local/tomcat/conf/server.xml.backup
COPY ./conf/server.xml /usr/local/tomcat/conf/server.xml

## install supervisor
RUN apt-get install -y libc6-i386 lib32gcc1 lib32z1 lib32stdc++6 supervisor

# start tomcat
#ENTRYPOINT ["/usr/local/tomcat/bin/startup.sh"]
ENTRYPOINT ["/usr/local/tomcat/bin/catalina.sh", "run"]

# ngrok client
ADD ./ngrok.tar /usr/local/
COPY ./conf/ngrok_client.conf /usr/local/ngrok

# docker build . -t 'chunhui2001/ubuntu_1804_dev:tomcat8'
# docker run -dit --entrypoint="top" -P --name tomcat8 chunhui2001/ubuntu_1804_dev:tomcat8
# docker run -dit -p 80:8080 --name tomcat8 chunhui2001/ubuntu_1804_dev:tomcat8
# docker push chunhui2001/ubuntu_1804_dev:tomcat8
# docker pull chunhui2001/ubuntu_1804_dev:tomcat8

# Open ports
EXPOSE 8080
