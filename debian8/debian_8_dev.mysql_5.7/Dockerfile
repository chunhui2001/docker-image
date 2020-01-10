# chunhui2001/debian_8_dev:mysql_5.7
# Version 0.0.1
FROM mysql:5.7
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

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
#  docker run -d -P -e MYSQL_ROOT_PASSWORD=Cc --name mysql_dev --hostname mysql_dev chunhui2001/debian_8_dev:mysql_5.7


# 开启 root 远程链接
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION; 
# FLUSH PRIVILEGES; 

RUN chown -R mysql:mysql /var/lib/mysql_data
#ADD my.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

RUN apt-get update -y && apt-get install -y --no-install-recommends apt-utils inetutils-tools inetutils-ping

WORKDIR /var/lib/mysql_data


# 推送到私服
# docker tag chunhui2001/debian_8_dev:mysql_5.7 172.28.128.3:5000/chunhui2001/debian_8_dev:mysql_5.7
# docker push 172.28.128.3:5000/chunhui2001/debian_8_dev:mysql_5.7
# docker pull 172.28.128.3:5000/chunhui2001/debian_8_dev:mysql_5.7

# 列出私服上的所有景象
# curl http://172.28.128.3:5000/v2/_catalog

# 列出镜像的所有 tag
# curl http://172.28.128.3:5000/v2/chunhui2001/ubuntu_20.04_dev/tags/list
# 获取镜像的 Digest
# curl http://172.28.128.3:5000/v2/chunhui2001/ubuntu_20.04_dev/manifests/confluence-jira
# curl http://172.28.128.3:5000/v2/{{          镜像名         }}/manifests/{{  镜像名tag  }}

# 删除私服上的镜像
# 登录到私服容器所在的宿主服务器
# docker exec {{私服容器名字}} rm -rf /var/lib/registry/docker/registry/v2/repositories/{{将要删除的镜像名字}}
# 清除残留的 blob
# docker exec {{私服容器名字}} bin/registry garbage-collect /etc/docker/registry/config.yml

# Open ports
EXPOSE 3306
