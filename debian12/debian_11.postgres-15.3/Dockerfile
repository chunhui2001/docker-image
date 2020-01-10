# chunhui2001/debian12:postgres-15.3
# Version 0.0.1
FROM postgres:15.3
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

RUN apt-get update -y && \
	apt-get install -y vim build-essential lsb-release net-tools iputils-ping apt-utils wget ttf-wqy-microhei locales iproute2 curl ttf-wqy-microhei ttf-wqy-zenhei locales procps

### 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

### 开启中文支持
# RUN locale-gen zh_CN.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
# RUN localedef -c -f UTF-8 -i zh_CN zh_CN.UTF-8
# ENV LANG zh_CN.UTF-8
# ENV LANGUAGE zh_CN:zh
# ENV LC_LANG zh_CN.UTF-8
# ENV LC_ALL zh_CN.UTF-8

### alias
RUN echo "alias 'll=ls -al'" >> /root/.bashrc && echo "alias 'lll=ls -lh'" >> /root/.bashrc 

# WORKDIR /root


### Launch postgres using Docker
# docker run \
#   -e POSTGRES_USER=keesh \
#   -e POSTGRES_PASSWORD=Cc \
#   -e POSTGRES_DB=newsletter \
#   -p "5432":5432 \
#   -d postgres:15.3 \
#   postgres -N 1000
#   # ^ Increased maximum number of connections for testing purposes


### 1. 进入 postgres cli
$ /usr/bin/psql -U keesh newsletter 

### 2. 修改密码
# $ psql postgres 
# postgres=# alter user postgres with password 'your password';
# ALTER ROLE
# postgres=# 

### 3. 创建用户
# ...

### 4. 创建数据库
# ...

### 5. 切换数据库
# > keesh=# \c newsletter

### 6. 创建表
# CREATE TABLE subscriptions(
#    id uuid NOT NULL,
#    email TEXT NOT NULL UNIQUE,
#    name TEXT NOT NULL,
#    subscribed_at timestamptz NOT NULL,
#    PRIMARY KEY (id)
# );

# docker build -f Dockerfile . -t 'chunhui2001/debian12:postgres-15.3'
# docker run -dit --entrypoint="top" --name postgres_9.6 chunhui2001/debian12:postgres-15.3
# docker push chunhui2001/debian12:postgres-15.3
# docker pull chunhui2001/debian12:postgres-15.3
# docker commit -a "chunhui.zhang" -m "my postsqlgre" 88dd00995e89  chunhui2001/debian12:postgres-15.3

# Open ports
EXPOSE 5432
