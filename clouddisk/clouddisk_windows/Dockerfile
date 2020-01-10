# chunhui2001/clouddisk:windows
# Version 0.0.1
# FROM alpine
FROM 184cd411dbae
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# curl 下载文件
# sudo curl -L -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
# sudo chmod a+rx /usr/local/bin/youtube-dl

### COPY 7z1604-x64.exe /soft/
### COPY Fixmbr.rar /soft/
### COPY Xshell_5.0.0.37_setup.1459931786.exe /soft/ 
# Windows docker 环境
### COPY DockerToolbox-18.03.0-ce.exe /soft/
# git bash
### COPY Git-2.23.0-64-bit.exe /soft/
# UltraEdit
### COPY ultraedit64wpjb.zip /soft/
# UltraEdit windows 破解程序
### COPY IDM+All+Products+KeyGen+v3.6.zip /soft/ 	# 184cd411dbae



# docker build . -t 'chunhui2001/clouddisk:windows'
# docker run -dit --entrypoint="top" --name clouddisk_windows chunhui2001/clouddisk:windows
# docker push chunhui2001/clouddisk:windows
# docker pull chunhui2001/clouddisk:windows


# 查看指定镜像被哪个镜像依赖
# docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=指定的镜像id -q)

ENTRYPOINT ["top"]

