# chunhui2001/ubuntu_1804_dev:elasticsearch
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# https://www.elastic.co/downloads/
# curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl

ENV JAVA_OPTS=
ENV ES_JAVA_OPTS="-server -Xms128m -Xmx128m -Xmn64m"

# add user
RUN useradd -ms /bin/bash newuser

# set work dir
WORKDIR /usr/local/

## add and un tar files
ADD jdk-12.0.2_linux-x64_bin.tar.gz ./
ADD elasticsearch-7.3.0-linux-x86_64.tar.gz ./

RUN chown -R newuser:newuser /usr/local/elasticsearch-7.3.0
RUN ln -s /usr/local/jdk-12.0.2 /usr/local/java
RUN ln -s /usr/local/elasticsearch-7.3.0 /usr/local/elasticsearch

# execute update-alternatives to use java 12
RUN update-alternatives --install /usr/bin/java java /usr/local/java/bin/java 300
RUN update-alternatives --install /usr/bin/javac javac /usr/local/java/bin/javac 300
RUN update-alternatives --install /usr/bin/jar jar /usr/local/java/bin/jar 300
#RUN update-alternatives --install /usr/bin/javah javah /usr/local/java/bin/javah 300
RUN update-alternatives --install /usr/bin/jps jps /usr/local/java/bin/jps 300

RUN apt-get install -y curl 

RUN mv /usr/local/elasticsearch/jdk /usr/local/elasticsearch/open_jdk
RUN ln -s /usr/local/jdk-12.0.2 /usr/local/elasticsearch/jdk

USER newuser

WORKDIR /home/newuser

# ENTRYPOINT ["/usr/local/elasticsearch/bin/elasticsearch"]


# docker build . -t 'chunhui2001/ubuntu_1804_dev:elasticsearch'
# docker run -dit --entrypoint="/usr/local/elasticsearch/bin/elasticsearch" --name elastic chunhui2001/ubuntu_1804_dev:elasticsearch
# docker push chunhui2001/ubuntu_1804_dev:elasticsearch
# docker pull chunhui2001/ubuntu_1804_dev:elasticsearch

# Open ports
EXPOSE 9300 9200


