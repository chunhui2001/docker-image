# chunhui2001/ubuntu_1804_dev:tomcat9
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:java12
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# http://apr.apache.org/download.cgi
# Pick from chunhui2001/clouddisk:java
ADD ./apache-tomcat-9.0.30.tar.gz /usr/local/
ADD ./apr-1.7.0.tar.gz /usr/local/
ADD ./apr-util-1.6.1.tar.gz /usr/local/
ADD ./apr-iconv-1.2.2.tar.gz /usr/local/
#ADD ./tomcat-native-1.2.23-src.tar.gz /usr/local/
ADD ./libtool-2.4.6.tar.gz /usr/local/

RUN ln -s /usr/local/apache-tomcat-9.0.30 /usr/local/tomcat
RUN ln -s /usr/local/apr-1.7.0 /usr/local/apr-src
RUN ln -s /usr/local/apr-util-1.6.1 /usr/local/apr-util
RUN ln -s /usr/local/apr-iconv-1.2.2 /usr/local/apr-iconv-src
#RUN ln -s /usr/local/tomcat-native-1.2.23-src /usr/local/tomcat-native-src

# Add tomcat group and tomcat user
RUN groupadd tomcat && chown -R root:root /usr/local/tomcat 
RUN useradd -s /bin/false -g tomcat -d /usr/local/tomcat tomcat

RUN apt-get update -y && apt-get install -y libtool make libexpat1-dev m4

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

## libtool
WORKDIR /usr/local/libtool-2.4.6
RUN ./configure && make -j4 && make install
RUN libtool --finish /usr/local/apr-iconv/lib/iconv

## Tomcat native
RUN tar -zxvf /usr/local/tomcat/bin/tomcat-native.tar.gz -C /usr/local/
RUN ln -s /usr/local/tomcat-native-*-src /usr/local/tomcat-native-src
WORKDIR /usr/local/tomcat-native-src/native
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

WORKDIR /usr/local/tomcat/webapps
VOLUME ["/usr/local/tomcat/webapps/ROOT", "/usr/local/tomcat/logs"]

## RUN sed -i "s#SSLEngine=\"on\"#SSLEngine=\"off\"#g" /usr/local/tomcat/conf/server.xml
RUN cp /usr/local/tomcat/conf/server.xml /usr/local/tomcat/conf/server.xml.backup
COPY ./conf/server.xml /usr/local/tomcat/conf/server.xml

# start tomcat
#ENTRYPOINT ["/usr/local/tomcat/bin/startup.sh"]
ENTRYPOINT ["/usr/local/tomcat/bin/catalina.sh", "run"]

# 启动程序时, 加入 /usr/local/apr/lib 用于启用 Tomcat APR
# java -Djava.library.path=/usr/local/apr/lib -jar /root/app/app.jar

# docker build . -t 'chunhui2001/ubuntu_1804_dev:tomcat9'
# docker run -dit --entrypoint="top" -P --name tomcat9 chunhui2001/ubuntu_1804_dev:tomcat9
# docker run -dit -p 8080:8080 --name tomcat9 chunhui2001/ubuntu_1804_dev:tomcat9
# docker push chunhui2001/ubuntu_1804_dev:tomcat9
# docker pull chunhui2001/ubuntu_1804_dev:tomcat9

# Open ports
#EXPOSE 8080
