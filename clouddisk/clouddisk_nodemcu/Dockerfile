# chunhui2001/clouddisk:nodemcu
# Version 0.0.1
# FROM alpine
FROM 27b7a2a5294d
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# curl 下载文件
# sudo curl -L -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
# sudo chmod a+rx /usr/local/bin/youtube-dl

WORKDIR /soft

### COPY ESPlorer.zip /soft
### COPY esptool /soft
### COPY init.lua /soft
# Mac OS USB 转串口驱动
### COPY Mac_OSX_VCP_Driver.zip /soft
### COPY NodeMCU.md /soft 				# 27b7a2a5294d


# docker build . -t 'chunhui2001/clouddisk:nodemcu'
# docker run -dit --entrypoint="top" --name clouddisk_nodemcu chunhui2001/clouddisk:nodemcu
# docker push chunhui2001/clouddisk:nodemcu
# docker pull chunhui2001/clouddisk:nodemcu

# 查看指定镜像被哪个镜像依赖
# docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=指定的镜像id -q)

ENTRYPOINT ["top"]

