
## 官方镜像中心
https://hub.docker.com

### 找出系统大文件
## sudo du -a / 2>/dev/null | sort -n -r | head -n 20

## 可以使用下面的命令列出所有在指定 image 之后创建的 image 的父 image
$ docker image inspect --format='{{.RepoTags}} {{.Id}} {{.Parent}}' $(docker image ls -q --filter since=xxxxxx)

## 删除所有容器 
$ docker rm $(docker ps -a -q)

## 删除所有镜像
$ docker rmi $(docker images | grep "^<none>" | awk "{print $3}")

## 启动一个一直运行的容器
$ docker run -dit --name devlab chunhui2001/ubuntu_1610_dev:zh-CN /bin/bash


### docker networking
$ docker network create supercard-network
$ docker network ls OR docker network ls -q

## create a container in a exist docker network, docker 网络名不可以有特殊字符
$ docker run -d -P --net=supercard_network --name daemon_dave chunhui2001/ubuntu_1610_dev:nginx_default

## 将 mysql_dev 容器加入 net1
$ docker network connect net1 mysql_dev

## docker 镜像导出与导入 export and import 
$ docker save [image id] [image id] > images.tar
$ docker load < images.tar
$ docker tag 0e5574283393 chunhui2001/ubuntu_1804_dev:redis_cluster

### 检查 Docker 容器空间
$ docker system df

### 清楚无用镜像
$ docker image prune -a

### 删除所有未使用的容器、镜像和卷。
$ docker system prune -a --volumes

### container name pattern, 
## 容器的名字必须是唯一的，当容器删除的时候会删除所有包含该名字的容器
## 删除容器的时候并不删除卷(volume)
## 方括号内的字符是变化的
> app.[container name]_[].
  [mysqldb or h2db or oracledb or redis or mongo or mssqldb or apache or nginx or tomcat nodejs].
  [volume or node or net]
> app.[ebid]_[volume].[mysqldb].[volume]
> app.[ebid]_[volume].[apache].volume]
> app.[ebid]_[node1].[nginx].node]
> app.[ebid]_[node2].[nginx].node]
> net.[ebid]

### docker build
$ docker build -t "registry/image name:tag" .

### docker run
$ docker run -d -P --name daemon "registry/image name:tag" -g "daemon off;"

### docker exec
$ docker exec -it "container name or container id" /bin/bash

### docker commit
$ sudo docker commit [614122c0aabb] chunhui2001/alpine:3.13.python-3.8.7.kline

### docker cp
$ docker cp /www/runoob 96f7f14e99ab:/www/

### 查看 docker 镜像存储空间容量
$ du -sh /var/lib/docker

### vim replace
:%s/usr\/lib\/jvm\/java-7-sun/usr\/local\/java/gc

### remove large file from github
$ git rm --cached giant_file
$ git commit --amend -CHEAD
$ git push

### github remote add 
$ echo "# docker-images" >> README.md
$ git init
$ git add README.md
$ git commit -m "first commit"
$ git remote add origin git@github.com:chunhui2001/docker-images.git
$ git push -u origin master


## 将已有容器连接到 docker 网络
$ docker network connect supercard-network daemon_redis

## 断开一个容器与指定网络的连接
$ docker network disconnect supercard-network daemon_redis

## 删除一个 docker 网络
$ docker network rm supercard-network

## 查看一个 docker 网络下的所有容器
$ docker inspect --format='{{ .Containers }}' supercard-network

## 通过模版来查找所有退出码为非 0 的容器名
$ docker inspect -f '{{if ne 0.0 .State.ExitCode }}{{.Name}} {{.State.ExitCode}}{{ end }}' $(docker ps -aq)

## 在 jenkins-data 容器中查找卷 /var/jenkins_home 对应在 host 的目录
$ docker inspect -f '{{index .Volumes "/var/jenkins_home"}}' jenkins-data

## 查看所有容器的 ip 地址
$ docker inspect --format '{{ .NetworkSettings.IPAddress }}' `docker ps -aq`

## 根据容器名字列出指定网络下的所有容器的 ip
$ docker inspect -f '{{ .NetworkSettings.Networks.supercard_network.IPAddress }}' `docker ps -a | grep supercard |  awk '{split($0,a," " ); print a[1]}'`

# Ubuntu 16.04 安装Docker ，Pull Docker image的时候遇到docker pull TLS handshake timeout
http://blog.csdn.net/han_cui/article/details/55190319

## docker ps 格式化输出
## https://genzouw.com/entry/2023/02/07/093453/3218/
docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Size}}\t{{.Status}}"
docker ps -a --format "table {{.Names}}\t{{.Ports}}\t{{.Size}}\t{{.Status}}"
docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Command}}\t{{.Image}}\t{{.Ports}}"

--format="TEMPLATE"
Pretty-print containers using a Go template.
Valid placeholders:
.ID - Container ID
.Image - Image ID
.Command - Quoted command
.CreatedAt - Time when the container was created.
.RunningFor - Elapsed time since the container was started.
.Ports - Exposed ports.
.Status - Container status.
.Size - Container disk size.
.Names - Container names.
.Labels - All labels assigned to the container.
.Label - Value of a specific label for this container. For example {{.Label "com.docker.swarm.cpu"}}
.Mounts - Names of the volumes mounted in this container.


### https://nodejs.org/en/download/releases
### nvm install
brew uninstall --ignore-dependencies node
brew uninstall --force node
brew install nvm

### add the following line to your shell profile
source $(brew --prefix nvm)/nvm.sh

nvm install --lts
nvm install 12.7.0

nvm use 16
node -v
v16.17.0

nvm use 12
node -v
v12.7.0



