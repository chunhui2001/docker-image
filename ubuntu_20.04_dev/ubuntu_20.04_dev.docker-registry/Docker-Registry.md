### Docker 镜像仓库安装
#### 从 docker 仓库拉取 registry 私服仓库镜像
$ docker pull registry

#### 运行私服容器
$ docker run -d -p 5000:5000 --privileged=true -e REGISTRY_STORAGE_DELETE_ENABLED=true --name myregistry --restart=always registry
#### 浏览器端访问
http://ip:5000/v2/
$ curl http://ip:5000/v2/

### docker 客户端添加私服仓库地址 (如搭建docker集群需要给每台docker环境进行如下操作) (可选)
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
$ docker push ubuntu_20.04_dev:confluence-jira
```
由于 docker 默认镜像仓库是 dockerhub，所以此命令会默认推送到 docker.io/，
因此，想要将镜像推送到私服仓库中，需要修改镜像标签。将私服地址作为镜像 tag 的一部分
```
### 修改镜像标签后再次执行命令
# docker tag ubuntu_20.04_dev:confluence-jira 172.28.128.3:5000/ubuntu_20.04_dev:confluence-jira
# docker push 172.28.128.3:5000/ubuntu_20.04_dev:confluence-jira
# docker pull 172.28.128.3:5000/ubuntu_20.04_dev:confluence-jira

$ curl http://172.28.128.3:5000/v2/_catalog　　# 查看仓库中全部镜像
$ curl http://172.28.128.3:5000/v2/{{镜像名}}/tags/list  # 查看镜像版本号

### 列出私服上的所有镜像
#### curl http://172.28.128.3:5000/v2/_catalog
### 列出镜像的所有 tag
#### curl http://172.28.128.3:5000/v2/chunhui2001/ubuntu_20.04_dev/tags/list

### 删除1: 通过 Digest Etag 删除私服上的镜像 (此方式删的不干净, 推荐下面的方法2)
#### 获取镜像的 Digest
#### curl --header "Accept: application/vnd.docker.distribution.manifest.v2+json" -I http://ip:port/v2/{{imagename}}/manifests/{{imagetag}}
>>> HTTP/1.1 200 OK
>>> Content-Length: 2619
>>> Content-Type: application/vnd.docker.distribution.manifest.v2+json
>>> Docker-Content-Digest: sha256:b8d116ba453b2dff37605fa112b0a5b02b880e78eb0adda941e22d0b75890e98
>>> Docker-Distribution-Api-Version: registry/2.0
>>> Etag: "sha256:b8d116ba453b2dff37605fa112b0a5b02b880e78eb0adda941e22d0b75890e98"       # 删除镜像时会用到该 Etag
>>> X-Content-Type-Options: nosniff
>>> Date: Wed, 05 Feb 2020 13:25:34 GMT
#### curl -X DELETE http://172.28.128.3:5000/v2/chunhui2001/ubuntu_20.04_dev/manifests/{{Digest_Etag_here}}

### 删除2: 通过私服容器删除私服上的镜像 (登录到私服容器所在的宿主服务器)
#### 删除镜像 image
#### docker exec {{私服容器名字}} rm -rf /var/lib/registry/docker/registry/v2/repositories/{{将要删除的镜像名字}}
#### 清除残留的 blob
#### docker exec {{私服容器名字}} bin/registry garbage-collect /etc/docker/registry/config.yml


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
      - 5001:80
    volumes:
      - ./certs/frontend.crt:/etc/apache2/server.crt:ro
      - ./certs/frontend.key:/etc/apache2/server.key:ro
    environment:
      - ENV_DOCKER_REGISTRY_HOST=172.16.197.76
      - ENV_DOCKER_REGISTRY_PORT=5000


