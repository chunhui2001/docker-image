# chunhui2001/ubuntu_1610_dev:java8
# Version 0.0.1
FROM chunhui2001/ubuntu_1610_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# copy files
# COPY jdk-8u151-linux-x64.tar.gz /usr/local/

# download files
WORKDIR /usr/local

# https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

# extract files 
RUN tar -zxf /usr/local/jdk-*.tar.gz -C /usr/local/ && mv /usr/local/jdk1.8* /usr/local/java

# execute update-alternatives to use java 8
RUN update-alternatives --install /usr/bin/java java /usr/local/java/bin/java 300
RUN update-alternatives --install /usr/bin/javac javac /usr/local/java/bin/javac 300
RUN update-alternatives --install /usr/bin/jar jar /usr/local/java/bin/jar 300
RUN update-alternatives --install /usr/bin/javah javah /usr/local/java/bin/javah 300
RUN update-alternatives --install /usr/bin/jps jps /usr/local/java/bin/jps 300

#RUN update-alternatives --config java 

RUN wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz -P /usr/local/ && tar -zxf /usr/local/apache-maven-3.6.1-bin.tar.gz -C /usr/local/
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache//ant/binaries/apache-ant-1.10.5-bin.tar.gz -P /usr/local/ && tar -zxf /usr/local/apache-ant-1.10.5-bin.tar.gz -C /usr/local/

RUN apt-get install libc6-i386 lib32gcc1 lib32z1 lib32stdc++6 

RUN ln -s /usr/local/apache-maven-3.6.1 /usr/local/maven
RUN ln -s /usr/local/apache-ant-1.10.5 /usr/local/ant

ENV PATH=$PATH:/usr/local/ant/bin
ENV PATH=$PATH:/usr/local/maven/bin


# remove files
RUN rm /usr/local/*.tar.gz

# reset dir
WORKDIR /root/app

#ENTRYPOINT []
#CMD ["testing"]

# docker build . -t "chunhui2001/ubuntu_1610_dev:java8"
# docker run -it chunhui2001/ubuntu_1610_dev:java8 

# Open ports
EXPOSE 8081


