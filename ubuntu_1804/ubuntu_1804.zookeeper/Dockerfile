# chunhui2001/ubuntu_1804:zookeeper
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"


ENV ZOOKEEPER_HOME="/usr/local/zookeeper"

ADD ./apache-zookeeper-3.5.5-bin.tar.gz /usr/local/
RUN ln -s /usr/local/apache-zookeeper* $ZOOKEEPER_HOME
RUN mkdir $ZOOKEEPER_HOME/zoo_data && echo 1 > $ZOOKEEPER_HOME/zoo_data/myid

VOLUME [$ZOOKEEPER_HOME"/zoo_data"]

# echo ruok | nc localhost 2181
RUN apt-get update -y && apt-get -y install netcat-traditional openssh-server
RUN mkdir -p /var/run/sshd 
# RUN /usr/sbin/sshd -D &

ADD ./entrypoint.sh /etc/
RUN chmod +x /etc/entrypoint.sh

# 修改 root 密码, 用于 ssh 免密登陆
#RUN echo "root:root" | chpasswd

# docker build . -t 'chunhui2001/ubuntu_1804:zookeeper'
# docker run -dit --entrypoint="top" --name zk chunhui2001/ubuntu_1804:zookeeper
# docker push chunhui2001/ubuntu_1804:zookeeper
# docker pull chunhui2001/ubuntu_1804:zookeeper

CMD ["/etc/entrypoint.sh"]

EXPOSE 2181