# chunhui2001/ubuntu_20.04_dev:confluence-jira
# Version 0.0.1
FROM chunhui2001/ubuntu_20.04_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"



# 推送到私服
# docker tag chunhui2001/ubuntu_20.04_dev:confluence-jira 172.28.128.3:5000/chunhui2001/ubuntu_20.04_dev:confluence-jira
# docker push 172.28.128.3:5000/chunhui2001/ubuntu_20.04_dev:confluence-jira
# docker pull 172.28.128.3:5000/chunhui2001/ubuntu_20.04_dev:confluence-jira

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

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:confluence-jira'
# docker run -dit --entrypoint="top" -p 8090:8090 --name ubuntu20.04-confluence-jira chunhui2001/ubuntu_20.04_dev:confluence-jira
# docker run -dit -p 8080:8080 --name ubuntu20.04-confluence-jira chunhui2001/ubuntu_20.04_dev:confluence-jira
# docker push chunhui2001/ubuntu_20.04_dev:confluence-jira
# docker pull chunhui2001/ubuntu_20.04_dev:confluence-jira

# Open ports
EXPOSE 8090
