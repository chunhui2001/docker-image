# chunhui2001/ubuntu_1804:php7.2
# Version 0.0.1
FROM chunhui2001/ubuntu_1804:apache24
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive \
    TIMEZONE=Asia/Shanghai 

RUN apt-get install php7.2 php7.2-fpm php7.2-dev php7.2-mysql php7.2-dom php7.2-xmlreader php7.2-curl php7.2-exif php7.2-gd  php7.2-iconv php7.2-imagick php7.2-json php7.2-mbstring php7.2-posix php7.2-sockets php7.2-tokenizer php7.2-soap php7.2-intl libapache2-mod-php7.2 -y 


RUN a2enconf php7.2-fpm && a2enmod proxy_fcgi setenvif

## 查看版本
# php -v

## 查看扩展路径
# php-config --extension-dir

# docker build . -t 'chunhui2001/ubuntu_1804:php7.2'
# docker run -dit --entrypoint="top" --name php7.2 chunhui2001/ubuntu_1804:php7.2
# docker push chunhui2001/ubuntu_1804:php7.2
# docker pull chunhui2001/ubuntu_1804:php7.2

EXPOSE 80