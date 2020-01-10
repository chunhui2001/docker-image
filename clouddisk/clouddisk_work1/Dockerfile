# chunhui2001/clouddisk:work1
# Version 0.0.1
# FROM alpine
FROM 97c3294ab6f9
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# curl 下载文件
# sudo curl -L -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
# sudo chmod a+rx /usr/local/bin/youtube-dl

WORKDIR /soft

### COPY workspace_autopilot /soft
### COPY workspace_charge /soft
### COPY workspace_cloudbox /soft
### COPY workspace_smartcloud /soft 			# 916dbd26f100
### COPY CloudBox /soft 	# 97c3294ab6f9


# docker build . -t 'chunhui2001/clouddisk:work1'
# docker run -dit --entrypoint="top" --name clouddisk_work1 chunhui2001/clouddisk:work1
# docker push chunhui2001/clouddisk:work1
# docker pull chunhui2001/clouddisk:work1
# docker cp clouddisk_windows:/soft/ngrok.tar ~/Desktop/ngrok.tar 		# 0f8336680452

# 查看指定镜像被哪个镜像依赖
# docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=指定的镜像id -q)

ENTRYPOINT ["top"]

