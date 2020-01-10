# chunhui2001/clouddisk:vagrant
# Version 0.0.1
#FROM alpine
FROM 5dbf1654ac1a
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# curl 下载文件
# sudo curl -L -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
# sudo chmod a+rx /usr/local/bin/youtube-dl

WORKDIR /soft

### COPY vagrant_2.2.5_x86_64.dmg /soft/			# eecbd0907c4b
### COPY VBoxGuestAdditions.iso /soft/				# f149bdec9bf5 	for VirtualBox 6.0.10 r132072
# vagrant box add peru/ubuntu-18.04-desktop-amd64 ~/Desktop/ubuntu-18.04-desktop-amd64.box
### COPY ubuntu-18.04-desktop-amd64.box  /soft/
# vagrant box add chunhuizhang/ubuntu-18.04-desktop-amd64.zh_CN ~/Desktop/ubuntu-18.04-desktop-amd64.zh_CN.box
### COPY ubuntu-18.04-desktop-amd64.zh_CN.box /soft/ 	# 2d0c69a680ce
### COPY ubuntu-18.04.3-desktop-amd64.iso /soft/ 			# 5dbf1654ac1a

## teryx 始祖鸟


# docker build . -t 'chunhui2001/clouddisk:vagrant'
# docker run -dit --entrypoint="top" --name vagrant chunhui2001/clouddisk:vagrant
# docker push chunhui2001/clouddisk:vagrant
# docker pull chunhui2001/clouddisk:vagrant

# 查看指定镜像被哪个镜像依赖
# docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=指定的镜像id -q)

ENTRYPOINT ["top"]