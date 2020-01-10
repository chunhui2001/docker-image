# chunhui2001/ubuntu_1804_dev:rocketmq
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ADD ./rocketmq-all-4.2.0-bin-release.tar /usr/local/
RUN apt-get install -y unzip supervisor git
RUN ln -s /usr/local/rocketmq-all-4.2.0-bin-release /usr/local/rocketmq

CMD ["/usr/bin/supervisord"]

# docker build . -t 'chunhui2001/ubuntu_1804_dev:rocketmq'
# docker run -dit --entrypoint="top" --name rocketmq chunhui2001/ubuntu_1804_dev:rocketmq
# docker push chunhui2001/ubuntu_1804_dev:rocketmq
# docker pull chunhui2001/ubuntu_1804_dev:rocketmq

# Open ports
EXPOSE 9876 10911





