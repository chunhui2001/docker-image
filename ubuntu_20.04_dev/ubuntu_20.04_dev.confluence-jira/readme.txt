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


### JIRA 7.8 版本的安装与pojie
# https://www.cnblogs.com/houchaoying/p/9096118.html
# JIRA 下载地址: https://www.atlassian.com/software/jira/update
### pojie
# 先关闭 jira，然后把pojie包里面的 atlassian-extras-3.2.jar 和 mysql-connector-java-5.1.39-bin.jar 两个文件复制到 /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/ 目录下。
# 其中 atlassian-extras-3.2.jar 是用来替换原来的 atlassian-extras-3.2.jar 文件，用作pojie jira 系统的。
# 而 mysql-connector-java-5.1.39-bin.jar 是用来连接 mysql 数据库的驱动软件包。
# 在 /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/ 这个目录下，找到 atlassian-extras- 的包看看是3点几的 然后现在对应的pojie包，替换这个
### 如何修改内存？
$ vim /opt/atlassian/jira/bin/setenv.sh
### 日志查看：
$ tail -f /opt/atlassian/jira/logs/catalina.out

### agent pojie -- https://www.jianshu.com/p/b95ceabd3e9d
$ java -jar atlassian-agent.jar -d -m chunhui2001@gmail.com -n MicroEE -p jira -o http://192.168.0.89 -s BY9B-GWD1-1C78-K2DE
$ java -jar atlassian-agent.jar -d -m chunhui2001@gmail.com -n MicroEE -p jira -o microee.com -s BY9B-GWD1-1C78-K2DE