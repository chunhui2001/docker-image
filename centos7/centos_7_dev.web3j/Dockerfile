# chunhui2001/centos_7_dev:web3j
# Version 0.0.1
FROM chunhui2001/centos_7_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ADD jdk-8u281-linux-x64.tar.gz /usr/local/ 
ADD apache-ant-1.10.9-bin.tar.gz /usr/local/ 
ADD apache-maven-3.6.3-bin.tar.gz /usr/local/ 

RUN ln -s /usr/local/jdk1.8* /usr/local/java
RUN ln -s /usr/local/apache-ant-1.10.9 /usr/local/ant
RUN ln -s /usr/local/apache-maven-3.6.3 /usr/local/maven

# execute update-alternatives to use java 8
RUN update-alternatives --install /usr/bin/java java /usr/local/java/bin/java 300
RUN update-alternatives --install /usr/bin/javac javac /usr/local/java/bin/javac 300
RUN update-alternatives --install /usr/bin/jar jar /usr/local/java/bin/jar 300
RUN update-alternatives --install /usr/bin/javah javah /usr/local/java/bin/javah 300
RUN update-alternatives --install /usr/bin/jps jps /usr/local/java/bin/jps 300

#RUN update-alternatives --config java 

ENV PATH=$PATH:/usr/local/ant/bin
ENV PATH=$PATH:/usr/local/maven/bin
ENV JAVA_OPTS="-server -Xms128m -Xmx128m -Xmn64m -Xss256k"
ENV JAVA_HOME=/usr/local/java

ARG NODE_VERSION=v12.13.0
ENV REFRESHED_AT 2021-03-06
ENV NODE_VERSION $NODE_VERSION

RUN yum -y groupinstall "Development Tools"

## Download files and extract
WORKDIR /usr/local
RUN wget https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.xz && tar -xvJf node-$NODE_VERSION-linux-x64.tar.xz
RUN ln -s /usr/local/node-$NODE_VERSION-linux-x64 /usr/local/node && ln -s /usr/local/node/bin/node /usr/sbin/node && ln -s /usr/local/node/bin/npm /usr/sbin/npm

## npm config
RUN npm config set user 0
RUN npm config set unsafe-perm true
RUN npm config set prefix /usr/local
RUN npm install -g sm
RUN npm install -g --unsafe-perm node-gyp
RUN npm install -g gulp gulp-cli
RUN ln -s /usr/local/bin/gulp /usr/sbin/gulp
# gulp -v

# web3j install
RUN wget https://github.com/web3j/web3j/releases/download/v3.6.0/web3j-3.6.0.zip -O /usr/local/web3j-3.6.0.zip && unzip web3j-3.6.0.zip && rm -rf web3j-3.6.0.zip && ln -s web3j-3.6.0 web3j


ENV PATH=$PATH:/usr/local/ant/bin:/usr/local/web3j/bin

RUN npm install -g solc
# solcjs --version

## Clear files
RUN rm -rf /usr/local/*.tar.*

# docker build . -t 'chunhui2001/centos_7_dev:web3j'
# docker run -dit --entrypoint="top" -P --name web3j chunhui2001/centos_7_dev:web3j
# docker run -dit -P --name web3j chunhui2001/centos_7_dev:web3j
# docker push chunhui2001/centos_7_dev:web3j
# docker pull chunhui2001/centos_7_dev:web3j


### 使用 web3j 将 sol 智能合约转换成 java 文件
# https://my.oschina.net/duojin/blog/1818096
# https://github.com/web3j/web3j-cli

### remix
# https://remix.ethereum.org/






