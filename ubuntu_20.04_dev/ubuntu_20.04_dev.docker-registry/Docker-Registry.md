### Docker 镜像仓库安装
#### 从 docker 仓库拉取 registry 私服仓库镜像
$ docker pull registry

#### 运行私服容器
$ docker run -d -p 5000:5000  --name myregistry --restart=always registry
#### 浏览器端访问
http://ip:5000/v2/
$ curl http://ip:5000/v2/

### docker 客户端添加私服仓库地址 (如搭建docker集群需要给每台docker环境进行如下操作)
#### 更新私服仓库地址
$ vi /etc/docker/daemon.json
{
  "registry-mirrors": [
    "https://registry.docker-cn.com"
  ],
  "insecure-registries": [
    "ip:5000"
  ]
}

#### 查看 docker 信息确认仓库是否添加
docker info 

### 镜像推送&拉取
$ docker push localhost:5000/java:my
```
发现报错了
由于docker默认镜像仓库是dockerhub，所以java:my相当于docker.io/java:my，
因此，想要将镜像推送到私服仓库中，需要修改镜像标签。
```
### 修改镜像标签后再次执行命令
$ docker tag java:my 172.28.128.3:5000/java:my
$ docker push 172.28.128.3:5000/java:my

$ curl http://172.28.128.3:5000/v2/_catalog　　# 查看仓库中全部镜像
$ curl http://172.28.128.3:5000/v2/tomcat/tags/list  # 查看镜像版本号


### 部署 Docker Registry WebUI
```
私服安装成功后就可以使用 docker 命令行工具对 registry 做各种操作了。然而不太方便的地方是不能直观的查看 registry 中的资源情况。如果可以使用 UI 工具管理镜像就更好了。这里介绍两个 Docker Registry WebUI 工具
```
docker-registry-frontend
docker-registry-web
Harbor 					企业级应用推荐使用

#### docker-registry-fontend 
version: '3.1'
services:
  frontend:
    image: konradkleine/docker-registry-frontend:v2
    ports:
      - 8080:80
    volumes:
      - ./certs/frontend.crt:/etc/apache2/server.crt:ro
      - ./certs/frontend.key:/etc/apache2/server.key:ro
    environment:
      - ENV_DOCKER_REGISTRY_HOST=192.168.75.133
      - ENV_DOCKER_REGISTRY_PORT=5000


