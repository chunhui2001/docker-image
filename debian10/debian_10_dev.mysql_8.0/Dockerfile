# chunhui2001/debian_10_dev:mysql_8.0
# Version 0.0.1
FROM mysql:8.0.26
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
RUN apt-get update -y && apt-get install vim -y

# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 开启中文支持
RUN apt-get install ttf-wqy-microhei ttf-wqy-zenhei locales -y
RUN locale-gen zh_CN.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh
ENV LC_LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

# alias
RUN echo "alias 'll=ls -al'" >> /root/.bashrc && echo "alias 'lll=ls -lh'" >> /root/.bashrc 

VOLUME ["/var/lib/mysql_data"]

## Run container
#  docker run -d -P -e MYSQL_ROOT_PASSWORD=Cc --name mysql_dev --hostname mysql_dev chunhui2001/debian_10_dev:mysql_8.0


# 开启 root 远程链接
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION; 
# FLUSH PRIVILEGES; 

RUN chown -R mysql:mysql /var/lib/mysql_data
#ADD my.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

RUN apt-get update -y && apt-get install -y --no-install-recommends apt-utils inetutils-tools inetutils-ping

WORKDIR /var/lib/mysql_data

# docker build . -t 'chunhui2001/debian_10_dev:mysql_8.0'
# docker push chunhui2001/debian_10_dev:mysql_8.0
# docker pull chunhui2001/debian_10_dev:mysql_8.0
# docker run -dit --name mysql_8.0 chunhui2001/debian_10_dev:mysql_8.0 /bin/sh -c "while true; do echo 1 >/dev/null 2>/dev/null; sleep 1; done"

# Open ports
EXPOSE 3306
