## 查看Linux内核版本(内核版本必须是3.10或者以上):
$ cat /proc/version
$ uname -a
$ lsb_release -a

## 修改 hostname
$ hostnamectl set-hostname pluto

## 无法执行命令安装
$ yum install -y redhat-lsb

## 更新YUM源
$ yum update

## 安装 docker
$ yum  install docker -y

## 检查版本
$ docker -v

## 启动服务
$ service docker start

## 开机启动
$ chkconfig docker on

## 安装Docker Compose
$ curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose
$ docker-compose --version
$ docker-compose up -d


## docker-compose.yml 示例
version: '2.4'
networks:
  nets:
    external: false
    # aliases: net1

services:
  tomcat:
    container_name: mylab2013
    image: chunhui2001/ubuntu_1610_dev:tomcat8  
    mem_limit: 300m
    ports:
      - 9000:8080
    volumes:
      - /Users/keesh/workspace_cloudbox/mylab2013/war/:/usr/local/tomcat/webapps/ROOT:ro
    restart: always
    networks:
      - nets

      