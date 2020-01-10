# chunhui2001/ubuntu_1804_dev:elasticsearch.head
# Version 0.0.1
FROM chunhui2001/ubuntu_1610_dev:nodejs_base
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ADD ./elasticsearch-head.tar /usr/local/
WORKDIR /usr/local/elasticsearch-head

ENTRYPOINT ["/usr/local/elasticsearch-head/node_modules/grunt/bin/grunt", "server"]

# docker build . -t 'chunhui2001/ubuntu_1804_dev:elasticsearch.head'
# docker run -dit -P --entrypoint="top" --name elasticsearch.head chunhui2001/ubuntu_1804_dev.elasticsearch.head
# docker push chunhui2001/ubuntu_1804_dev:elasticsearch.head
# docker pull chunhui2001/ubuntu_1804_dev:elasticsearch.head

EXPOSE 9100