
**************************************************
****************** installation ******************
**************************************************
# update sources.list
$ sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
$ sudo vi /etc/apt/sources.list.d/docker.list
> deb https://apt.dockerproject.org/repo ubuntu-xenial main

# installation on 18.04
$ sudo apt-get update
$ sudo apt-get install curl apt-transport-https ca-certificates software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
$ sudo apt update
$ apt-cache policy docker-ce
$ sudo apt install docker-ce

$ docker --version
$ sudo systemctl status docker
$ sudo service docker status (check docker service is started)
$ sudo docker run hello-world (check docker installed correctly)

# added docker group
$ sudo groupadd docker

# add current user to docker group
$ sudo usermod -aG docker $USER && sudo gpasswd -a $USER docker

# restart the computer and log back
$ reboot


Uninstall Docker Engine
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get purge docker-ce docker-ce-cli containerd.io
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd


**************************************************
*************** simple docker file ***************
**************************************************
# create your first dockerfile
$ mkdir docker_screencasts && cd docker_screencasts && touch Dockerfile
> 
----------------------------------
FROM alpine

CMD ["echo", "hello world!"]
----------------------------------
$ docker build .
$ >
----------------------------------
Sending build context to Docker daemon  14.85kB
Step 1/2 : FROM alpine
latest: Pulling from library/alpine
88286f41530e: Pull complete 
Digest: sha256:f006ecbb824d87947d0b51ab8488634bf69fe4094959d935c0c103f4820a417d
Status: Downloaded newer image for alpine:latest
 ---> 76da55c8019d
Step 2/2 : CMD echo hello world!
 ---> Running in b81cedf9e4a2
 ---> fadf13ffce52
Removing intermediate container b81cedf9e4a2
Successfully built [fadf13ffce52]
----------------------------------

# docker run
$ docker run --name test fadf13ffce52


# remove docker run
$ docker rm test && docker build 
$ docker run --name test fadf13ffce52 (That should be print 'hello world!' on screen)

# run script in dockerfile
$ touch script.sh 
> 
----------------------------------
#! /bin/sh

echo hello world, from a script file!
----------------------------------
> 
----------------------------------
FROM alpine

COPY script.sh /script.sh
CMD ["/script.sh"]
----------------------------------

$ docker stop test && docker rm test
$ docker build . && docker run --name test [built id here]
$ docker stop test && docker rm test



## 修改 docker 镜像默认存储位置
# 新建 /etc/docker/daemon.json 文件
# 加入内容
{
    "graph": "/aliyun_nas/nas/docker-data",
    "storage-driver": "aufs"
}

## docker 加速
$ sudo curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://4e70ba5d.m.daocloud.io 
$ sudo service docker restart


## docker 镜像导出与导入 export and import 
$ docker save [image id] [image id] > images.tar
$ docker load < images.tar
$ docker tag 0e5574283393 chunhui2001/ubuntu_1804_dev:redis_cluster

## How to auto-restart Docker containers after a host server crash
https://bobcares.com/blog/auto-restart-docker-containers/2/
docker update --restart=on-failure:3 [container id here]

## Here are  Docker 18′ available subcommands:
docker attach – Attach local standard input, output, and error streams to a running container
docker build – Build an image from a Dockerfile
docker builder – Manage builds
docker checkpoint – Manage checkpoints
docker commit – Create a new image from a container's changes
docker config – Manage Docker configs
docker container – Manage containers
docker context – Manage contexts
docker cp – Copy files/folders between a container and local filesystem
docker create – Create a new container
docker diff – Inspect changes to files or directories on a container's filesystem
docker events – Get real time events from the server
docker exec – Run a command in a running container
docker export – Export a container's filesystem as a tar archive
docker history – Show the history of an image
docker image – Manage images
docker images – List images
docker import – Import the contents from a tarball to create a filesystem image
docker info – Display system-wide information
docker inspect – Return low-level information on Docker objects
docker kill – Kill one or more running containers
docker load – Load an image from a tar archive or STDIN
docker login – Log in to a Docker registry
docker logout – Log out from a Docker registry
docker logs – Fetch the logs of a container
docker manifest – Manage Docker image manifests and manifest lists
docker network – Manage networks
docker node – Manage Swarm nodes
docker pause – Pause all processes within one or more containers
docker plugin – Manage plugins
docker port – List port mappings or a specific mapping for the container
docker ps – List containers
docker pull – Pull an image or a repository from a registry
docker push – Push an image or a repository to a registry
docker rename – Rename a container
docker restart – Restart one or more containers
docker rm – Remove one or more containers
docker rmi – Remove one or more images
docker run – Run a command in a new container
docker save – Save one or more images to a tar archive (streamed to STDOUT by default)
docker search – Search the Docker Hub for images
docker secret – Manage Docker secrets
docker service – Manage services
docker stack – Manage stacks
docker start – Start one or more stopped containers
docker stats – Display a live stream of container(s) resource usage statistics
docker stop – Stop one or more running containers
docker swarm – Manage Swarm
docker system – Manage Docker
docker tag – Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
docker top – Display the running processes of a container
docker trust – Manage trust on Docker images
docker unpause – Unpause all processes within one or more containers
docker update – Update configuration of one or more containers
docker version – Show the Docker version information
docker volume – Manage volumes
docker wait – Block until one or more containers stop, then print their exit codes





