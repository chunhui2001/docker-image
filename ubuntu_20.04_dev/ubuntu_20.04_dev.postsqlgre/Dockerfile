# chunhui2001/ubuntu_20.04_dev:postsqlgre
# Version 0.0.1
FROM postgres:9.6
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

RUN apt-get update -y && apt-get install -y vim --no-install-recommends apt-utils inetutils-tools inetutils-ping

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

# 修改密码
# $ psql postgres 
# postgres=# alter user postgres with password 'your password';
# ALTER ROLE
# postgres=# 

# 创建用户
# CREATE USER kong_user WITH PASSWORD 'kong';
# 创建数据库,并给用户授权
# create database "kong";
# GRANT ALL PRIVILEGES ON DATABASE "kong" to kong;

# docker run --name postgres1 -e POSTGRES_PASSWORD=password -p 5432:5432 -d postgres:9.4
# docker run -d --name kong-database --network=kong-net -p 5432:5432 -e "POSTGRES_USER=kong" -e "POSTGRES_DB=kong" -e "POSTGRES_PASSWORD=kong" postgres:9.6

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:postsqlgre'
# docker run -dit --entrypoint="top" --name ubuntu20.04-postsqlgre chunhui2001/ubuntu_20.04_dev:postsqlgre
# docker push chunhui2001/ubuntu_20.04_dev:postsqlgre
# docker pull chunhui2001/ubuntu_20.04_dev:postsqlgre
# docker commit -a "chunhui.zhang" -m "my postsqlgre" 88dd00995e89  chunhui2001/ubuntu_20.04_dev:postsqlgre

# Open ports
EXPOSE 5432
