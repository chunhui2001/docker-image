# chunhui2001/centos_66_dev:java8
# Version 0.0.1
FROM chunhui2001/centos_66_dev:zh-CN 
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ADD jdk-8u221-linux-x64.tar.gz /usr/local/ 
ADD apache-ant-1.10.5-bin.tar.gz /usr/local/ 
ADD apache-maven-3.6.1-bin.tar.gz /usr/local/ 

RUN ln -s /usr/local/jdk1.8* /usr/local/java
RUN ln -s /usr/local/apache-ant-1.10.5 /usr/local/ant
RUN ln -s /usr/local/apache-maven-3.6.1 /usr/local/maven

# execute update-alternatives to use java 8
RUN update-alternatives --install /usr/bin/java java /usr/local/java/bin/java 300
RUN update-alternatives --install /usr/bin/javac javac /usr/local/java/bin/javac 300
RUN update-alternatives --install /usr/bin/jar jar /usr/local/java/bin/jar 300
RUN update-alternatives --install /usr/bin/javah javah /usr/local/java/bin/javah 300
RUN update-alternatives --install /usr/bin/jps jps /usr/local/java/bin/jps 300

#RUN update-alternatives --config java 

ENV PATH=$PATH:/usr/local/ant/bin
ENV PATH=$PATH:/usr/local/maven/bin
ENV JAVA_OPTS="-server -Xms128m -Xmx128m -Xmn64m"
ENV JAVA_HOME=/usr/local/java


# reset dir
WORKDIR /root/app

#ENTRYPOINT ["java", "-jar", "app.jar"]
#CMD ["java", "-jar", "app.jar"]
# CMD ["/usr/bin/supervisord"]

# docker build . -t "chunhui2001/centos_66_dev:java8"
# docker run -dit --entrypoint="top" --name java8 chunhui2001/centos_66_dev:java8 

# Open ports
EXPOSE 8081


