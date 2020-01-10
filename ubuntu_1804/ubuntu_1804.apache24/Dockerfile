# chunhui2001/ubuntu_1804:apache24
# Version 0.0.1
FROM chunhui2001/ubuntu_1804_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

RUN apt-get update -y && apt-get install -y apache2




ENTRYPOINT ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

# docker build . -t 'chunhui2001/ubuntu_1804:apache24'
# docker run -dit --entrypoint="top" --name ubuntu_apache24 chunhui2001/ubuntu_1804:apache24
# docker push chunhui2001/ubuntu_1804:apache24
# docker pull chunhui2001/ubuntu_1804:apache24

EXPOSE 80