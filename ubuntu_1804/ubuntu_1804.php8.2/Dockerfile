# chunhui2001/ubuntu_1804:php8.2
# Version 0.0.1
FROM chunhui2001/ubuntu_1804:apache24
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive \
    TIMEZONE=Asia/Shanghai

RUN apt-get update -y &&\
 apt install lsb-release ca-certificates apt-transport-https software-properties-common -y &&\
 add-apt-repository ppa:ondrej/php -y && apt-get update -y &&\
 apt install php8.2 python python-pip -y && pip install Pygments &&\
 apt install -y php8.2-common php8.2-fpm php8.2-dev php8.2-mysql php8.2-curl php8.2-gd php8.2-imagick php8.2-phpdbg &&\
 apt install -y php8.2-mbstring php8.2-soap php8.2-intl libapache2-mod-php8.2 php-http php-xml php8.2-xml &&\
 apt install -y libphp-phpmailer php8.2-bcmath php8.2-bz2 php8.2-intl php8.2-zip php-dev libmcrypt-dev &&\
 apt install -y gcc make musl-dev autoconf libc6-dev pkg-config php8.2-cli php8.2-cgi libphp8.2-embed php-mcrypt php8.2-mcrypt &&\
 apt install -y php8.2-raphf php-raphf php-xdebug php-pear php-zip &&\
 pecl channel-update pecl.php.net &&\
 pecl update-channels  &&\
 apt autoclean && apt autoremove &&\
 apt --purge autoremove &&\
 a2enmod proxy_fcgi setenvif php8.2 mpm_prefork && a2dismod mpm_event

# Verify PHP
#php --version

## 查看指定模块是否安装
# php -m | grep mcrypt

## 查看扩展路径
# php-config --extension-dir

# apache2ctl -M | grep php

# docker build . -t 'chunhui2001/ubuntu_1804:php8.2'
# docker run -dit --entrypoint="top" --name php8.2 chunhui2001/ubuntu_1804:php8.2
# docker push chunhui2001/ubuntu_1804:php8.2
# docker pull chunhui2001/ubuntu_1804:php8.2

EXPOSE 80

