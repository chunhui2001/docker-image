# chunhui2001/ubuntu_1804:php7.4
# Version 0.0.1
FROM chunhui2001/ubuntu_1804:apache24
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive \
    TIMEZONE=Asia/Shanghai

RUN apt-get update -y &&\
 apt install lsb-release ca-certificates apt-transport-https software-properties-common -y &&\
 add-apt-repository ppa:ondrej/php -y && apt-get update -y &&\
 apt install php7.4 python python-pip -y && pip install Pygments &&\
 apt install -y php7.4-common php7.4-fpm php7.4-dev php7.4-mysql php7.4-curl php7.4-gd php7.4-imagick php7.4-phpdbg &&\
 apt install -y php7.4-mbstring php7.4-soap php7.4-intl libapache2-mod-php7.4 php-http php7.4-xml &&\
 apt install -y libphp-phpmailer php7.4-bcmath php7.4-bz2 php7.4-intl php7.4-zip php-zip php-dev libmcrypt-dev &&\
 apt install -y gcc make musl-dev autoconf libc6-dev pkg-config php7.4-cli php7.4-cgi libphp7.4-embed php7.4-mcrypt php-mcrypt &&\
 apt install -y php7.4-raphf php-raphf php7.4-xdebug php-xdebug php-pear &&\
 pecl channel-update pecl.php.net &&\
 pecl update-channels  &&\
 apt clean autoclean && apt --purge autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}

# set default version
RUN update-alternatives --set php /usr/bin/php7.4
RUN update-alternatives --set phar /usr/bin/phar7.4
RUN update-alternatives --set phar.phar /usr/bin/phar.phar7.4
### If you have php5.6-dev installed as well
RUN update-alternatives --set phpize /usr/bin/phpize7.4
RUN update-alternatives --set php-config /usr/bin/php-config7.4

RUN a2enconf php7.4-fpm && a2enmod proxy_fcgi setenvif php7.4 mpm_prefork && a2dismod mpm_event

# Verify PHP
# php --version

## 查看指定模块是否安装
# php -m | grep mcrypt

## 查看扩展路径
# php-config --extension-dir

# apache2ctl -M | grep php

# docker build . -t 'chunhui2001/ubuntu_1804:php7.4'
# docker run -dit --entrypoint="top" --name php7.4 chunhui2001/ubuntu_1804:php7.4
# docker push chunhui2001/ubuntu_1804:php7.4
# docker pull chunhui2001/ubuntu_1804:php7.4

EXPOSE 80

