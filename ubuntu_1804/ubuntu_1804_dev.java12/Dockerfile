# chunhui2001/ubuntu_1804_dev:java12
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:zh-CN 
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ADD jdk-12.0.2_linux-x64_bin.tar.gz /usr/local/

RUN ln -s /usr/local/jdk-12.0.2 /usr/local/java

# execute update-alternatives to use java 12
RUN update-alternatives --install /usr/bin/java java /usr/local/java/bin/java 300
RUN update-alternatives --install /usr/bin/javac javac /usr/local/java/bin/javac 300
RUN update-alternatives --install /usr/bin/jar jar /usr/local/java/bin/jar 300
#RUN update-alternatives --install /usr/bin/javah javah /usr/local/java/bin/javah 300
RUN update-alternatives --install /usr/bin/jps jps /usr/local/java/bin/jps 300
#RUN update-alternatives --config java 

RUN apt-get install -y libc6-i386 lib32gcc1 lib32z1 lib32stdc++6 supervisor

# docker build . -t "chunhui2001/ubuntu_1804_dev:java12"
# docker run -it chunhui2001/ubuntu_1804_dev:java12 

# Open ports
EXPOSE 8081


