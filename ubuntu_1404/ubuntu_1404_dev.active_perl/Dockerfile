# chunhui2001/ubuntu_1404_dev:active_perl 
# Version 0.0.1
FROM chunhui2001/ubuntu_1404_dev:java8
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ADD ./ActivePerl-5.24.2.2403-x86_64-linux-glibc-2.15-403863.tar.gz /usr/local/
RUN ln -s /usr/local/ActivePerl* /usr/local/active_perl

WORKDIR /usr/local/active_perl
#RUN sh install.sh

# docker build . -t 'chunhui2001/ubuntu_1404_dev:active_perl'
# docker run -dit --entrypoint="top" --name active_perl chunhui2001/ubuntu_1404_dev:active_perl

## 提交镜像
# -a :提交的镜像作者；
# -c :使用Dockerfile指令来创建镜像；
# -m :提交时的说明文字；
# -p :在commit时，将容器暂停。

# docker commit -a "keesh.zhang" -m "Installed ActivePerl" -p 2f98ee7fe132 chunhui2001/ubuntu_1404_dev:active_perl

# Open ports
# EXPOSE 80