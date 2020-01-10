# chunhui2001/clouddisk:linux
# Version 0.0.1
#FROM alpine
FROM 7036f727c94b
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# curl 下载文件
# sudo curl -L -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
# sudo chmod a+rx /usr/local/bin/youtube-dl

### COPY ngrok.tar /soft/			# ngrok client
### COPY elasticsearch-7.3.0-linux-x86_64.tar.gz /soft
### COPY eclipse-jee-luna-SR2-linux-gtk-x86_64.tar.gz /soft
### COPY google-chrome-stable_current_amd64.deb /soft		# eaa6eac2491d
### COPY youtube-dl /soft									# b1786ba12fc3
### COPY apache-zookeeper-3.5.5.tar.gz /soft 				# XXXXX 该文件是 zookeeper 源码
### COPY hbase-1.1.5-bin.tar.gz /soft
### COPY Mycat-server-1.6.7.3-release-20190809210613-linux.tar.gz /soft 	# 0da534ec7825
### COPY apache-zookeeper-3.5.5-bin.tar.gz /soft
### COPY findbugs-3.0.1.tar.gz /soft
### COPY hadoop-2.4.0-src.tar.gz /soft
### COPY hadoop-2.6.0-src.tar.gz /soft
### COPY hadoop-3.2.0-src.tar.gz /soft
### COPY protobuf-2.5.0.tar.gz /soft 					# bc540bb615cb # 编译 hadoop 2.6.0 需要特定版本的 protobuf
### COPY ActivePerl-5.24.2.2403-x86_64-linux-glibc-2.15-403863.tar.gz /soft
### COPY glibc-2.9.tar.bz2 /soft
### COPY glibc-linuxthreads-2.5.tar.bz2 /soft 			# d4000c8f213b
### COPY hadoop-native-compile-2.4.0-work.tar /soft 	# uncer centos 6.6
### COPY hadoop-native.2.4.0.tar /soft 					# 58c8dd484bfd compiled uncer centos 6.6
### COPY hadoop-2.4.0.tar.gz /soft 						# 3c32ee22cb40
### COPY boost_1_60_0.tar.gz /soft 						# 70f750069887
### COPY thrift-0.12.0.tar.gz /soft 	 				# c3a86b7c78de

### COPY elasticsearch-head.tar /soft
### COPY rocketmq-all-4.2.0-bin-release.tar /soft
### COPY rocketmq-console-ng-1.0.1.tar /soft 			# 5aae9ef236c0
### COPY appengine-java7-sdk-1.9.34.zip /soft
### COPY eclipse-jee-2019-09-R-linux-gtk-x86_64.tar.gz /soft 	# 79ba16a76325
### COPY eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz /soft  		# ea06820a9239

### COPY eclipse-jee-neon-3-linux-gtk-x86_64.tar.gz /soft 
### COPY netbeans-11.2-bin.zip /soft 							# 7036f727c94b

# docker build . -t 'chunhui2001/clouddisk:linux'
# docker run -dit --entrypoint="top" --name clouddisk_linux chunhui2001/clouddisk:linux
# docker push chunhui2001/clouddisk:linux
# docker pull chunhui2001/clouddisk:linux
# docker cp clouddisk_linux:/soft/ngrok.tar ~/Desktop/ngrok.tar 		# 0f8336680452

# 查看指定镜像被哪个镜像依赖
# docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=指定的镜像id -q)

ENTRYPOINT ["top"]