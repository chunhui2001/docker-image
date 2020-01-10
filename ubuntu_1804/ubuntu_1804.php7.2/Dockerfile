# chunhui2001/ubuntu_1804:php7.2
# Version 0.0.1
FROM chunhui2001/ubuntu_1804:apache24
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive \
    TIMEZONE=Asia/Shanghai 

RUN apt-get update -y &&\
 apt-get install php7.2 python python-pip -y && pip install Pygments &&\
 php7.2-fpm php7.2-dev php7.2-mysql php7.2-dom php7.2-xmlreader php7.2-curl php7.2-exif php7.2-gd php7.2-iconv php7.2-imagick php7.2-json php7.2-mbstring php7.2-posix php7.2-sockets php7.2-tokenizer php7.2-soap php7.2-intl libapache2-mod-php7.2 php-http php7.2-xml libphp-phpmailer php7.2-bcmath php7.2-bz2 php7.2-intl php7.2-zip php-dev libmcrypt-dev gcc make autoconf libc-dev pkg-config -y && pecl install mcrypt-1.0.1

## Enable extension for apache
RUN echo "extension=mcrypt.so" | tee -a /etc/php/7.2/apache2/conf.d/mcrypt.ini
RUN echo "extension=mcrypt.so" >> /etc/php/7.2/cli/php.ini


RUN a2enconf php7.2-fpm && a2enmod proxy_fcgi setenvif php7.2 mpm_prefork && a2dismod mpm_event

## 查看版本
# php -v

## 查看指定模块是否安装
# php -m | grep mcrypt

## 查看扩展路径
# php-config --extension-dir

# apache2ctl -M | grep php

# docker build . -t 'chunhui2001/ubuntu_1804:php7.2'
# docker run -dit --entrypoint="top" --name php7.2 chunhui2001/ubuntu_1804:php7.2
# docker push chunhui2001/ubuntu_1804:php7.2
# docker pull chunhui2001/ubuntu_1804:php7.2

EXPOSE 80

