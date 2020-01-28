# chunhui2001/ubuntu_1804_dev:java8
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:zh-CN 
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

ENV JAVA_HOME=/usr/local/java
#ENV JAVA_OPTS="-server -Xms128m -Xmx128m -Xmn64m"
ENV M2_HOME=/usr/local/maven
ENV ANT_HOME=/usr/local/ant
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$PATH:$JAVA_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin

# reset dir
WORKDIR /root

#ENTRYPOINT ["java", "-jar", "app.jar"]
#CMD ["java", "-jar", "app.jar"]

# docker build . -t "chunhui2001/ubuntu_1804_dev:java8"
# docker run -dit --entrypoint="top" chunhui2001/ubuntu_1804_dev:java8 

# Open ports
#EXPOSE 8081


