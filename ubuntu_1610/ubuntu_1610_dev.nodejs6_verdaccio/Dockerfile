# ubuntu_1610_dev:nodejs6_verdaccio
# Version 0.0.1
FROM chunhui2001/ubuntu_1610_dev:nodejs_base
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"


RUN apt-get install -y mini-httpd
RUN npm install --global verdaccio
#RUN ln -s /usr/local/bin/verdaccio /usr/sbin/verdaccio

ADD config.yaml /root/nodejs/app/verdaccio/config.yaml
ADD htpasswd /root/nodejs/app/verdaccio/htpasswd

ENTRYPOINT ["verdaccio"]
# CMD ["server.js", $NODE_ENV]

# 生成随机密码并加到 /root/nodejs/app/verdaccio/htpasswd 文件
# htpasswd -bc /root/nodejs/app/verdaccio/htpasswd keesh.zhang zch1234560SA

# docker run -d -p 4873:4873 ubuntu_1610_dev:nodejs6_verdaccio

## Open ports
EXPOSE 4873
