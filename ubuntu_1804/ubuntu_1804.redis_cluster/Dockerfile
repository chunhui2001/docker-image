# chunhui2001/ubuntu_1804_dev:redis_cluster
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV REFRESHED_AT 2017-11-04

ADD redis-5.0.5.tar.gz /usr/local/
RUN ln -s /usr/local/redis-5.0.5 /usr/local/redis

#RUN echo 511 > /proc/sys/net/core/somaxconn
WORKDIR /usr/local/redis
RUN make && make install PREFIX=/usr/local/redis

RUN ln -s /usr/local/redis/bin/redis-benchmark /usr/sbin/redis-benchmark && \
	ln -s /usr/local/redis/bin/redis-check-aof /usr/sbin/redis-check-aof && \
	ln -s /usr/local/redis/bin/redis-check-rdb /usr/sbin/redis-check-rdb && \
	ln -s /usr/local/redis/bin/redis-cli /usr/sbin/redis-cli && \
	ln -s /usr/local/redis/bin/redis-sentinel /usr/sbin/redis-sentinel && \
	ln -s /usr/local/redis/bin/redis-server /usr/sbin/redis-server

ENTRYPOINT ["/usr/local/redis/src/redis-server", "/usr/local/redis/redis.conf"]
#CMD []

# docker build . -t 'chunhui2001/ubuntu_1804_dev:redis_cluster'
# docker run -dit --entrypoint="top" --name redis_cluster chunhui2001/ubuntu_1804_dev:redis_cluster
# docker push chunhui2001/ubuntu_1804_dev:redis_cluster
# docker pull chunhui2001/ubuntu_1804_dev:redis_cluster

EXPOSE 6379