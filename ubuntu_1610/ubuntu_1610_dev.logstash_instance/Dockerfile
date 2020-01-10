# chunhui2001/ubuntu_1610_dev:logstash_instance
# Version 0.0.1
FROM chunhui2001/ubuntu_1610_dev:logstash_base
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### Refer
# http://www.cnblogs.com/linuxboke/p/5706813.html
# https://my.oschina.net/guol/blog/182297
### logstash多个mysql的input导出到多个output
# http://m.blog.csdn.net/lilongsy/article/details/78283122

ADD logstash.conf /etc/logstash/conf.d/logstash.conf
#ADD logstash.yml /etc/logstash
ENV LS_HOME=/usr/share/logstash

WORKDIR /usr/share/logstash

ENTRYPOINT ["bin/logstash"]

CMD ["--path.settings", "/etc/logstash"]

### 查看版本
# logstash --version

### 安装插件
# logstash-plugin install -h
# logstash-plugin list
# logstash-plugin install --no-verify logstash-output-jdbc

### 构建镜像
# docker build -t chunhui2001/ubuntu_1610_dev:logstash_instance .
# docker run -dit --entrypoint="top" --name logstash chunhui2001/ubuntu_1610_dev:logstash_instance

## Open ports
#EXPOSE $HTTP_PORT
