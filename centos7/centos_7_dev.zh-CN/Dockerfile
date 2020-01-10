# chunhui2001/centos_7_dev:zh-CN
# Version 0.0.1
FROM centos:7
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# Install dev tools
RUN yum -y update && yum groupinstall -y "Development Tools" && yum install -y wget mkfontscale zlib-devel net-tools nmap-ncat.x86_64

## Install lsb
RUN yum install -y `yum provides */lsb_release | grep x86_64 | awk '{split($0,a,":" ); print a[1]}'`

# Install openssl
RUN wget https://ftp.openssl.org/source/old/1.1.1/openssl-1.1.1.tar.gz -P /usr/local/ && tar -zxf /usr/local/openssl-1.1.1.tar.gz -C /usr/local/ 
WORKDIR /usr/local/openssl-1.1.1
RUN ./config --prefix=/usr --openssldir=/etc/ssl --libdir=lib no-shared zlib-dynamic && make && make install && echo "/usr/local/lib64" >> /etc/ld.so.conf && ldconfig


#　ldconfig -v
# openssl version -a


## 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

## Chinese Support
RUN yum install -y kde-l10n-Chinese && yum reinstall -y glibc-common && yum groupinstall -y "fonts"
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh
ENV LC_ALL zh_CN.UTF-8

## 查看语言设置
# locale –a

RUN rm -rf /usr/local/*1_1_0f*

WORKDIR /root/



# docker build . -t 'chunhui2001/centos_7_dev:zh-CN'
# docker run -dit --entrypoint="top" -P --name centos7 chunhui2001/centos_7_dev:zh-CN
# docker run -dit -P --name centos7 chunhui2001/centos_7_dev:zh-CN
# docker push chunhui2001/centos_7_dev:zh-CN
# docker pull chunhui2001/centos_7_dev:zh-CN

# Open ports
# EXPOSE 80

# 修复
# -bash: warning: setlocale: LC_CTYPE: cannot change locale (UTF-8): No such file or directory
# vi /etc/environment
# LANG=zh_CN.UTF-8
# LANGUAGE=zh_CN:zh
# LC_ALL=zh_CN.UTF-8
