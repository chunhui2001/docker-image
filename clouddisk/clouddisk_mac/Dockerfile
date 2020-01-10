# chunhui2001/clouddisk:mac
# Version 0.0.1
#FROM alpine
FROM f1f44c80a24e
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

WORKDIR /

### COPY Docker.dmg /								# Docker
### COPY EasyConnect.dmg /							# VPN EasyConnect
### COPY Firefox-latest.dmg /						# Firefox
### COPY JavaForOSX2014-001.dmg /					# Java
### COPY NavicatPremium1118.dmg /					# navicat Premium
### COPY Postman-osx-7.2.2.zip /					# Postman
### COPY Sublime_Text_Build_3207.dmg /				# Sublime
### COPY TheUnarchiver.zip /						# 解压软件
### COPY Tunnelblick_3.7.8_build_5180.dmg /			# VPN Tunnelblick
### COPY UltraEdit_18.00.0.40.dmg /					# UltraEdit
### COPY WebStorm-2019.1.3.dmg /					# WebStorm
### COPY YinxiangBiji_RELEASE_9.0.7_458129.dmg /	# 印象笔记
### COPY charles-proxy-4.2.7.dmg /					# charles
### COPY eclipse-inst-mac64.tar.gz /			 	# eclipse 
### COPY googlechrome.dmg /							# ChromeS
### COPY ideaIU-2019.1.3.dmg /						# IDEA
### COPY luyten-OSX-0.5.4.zip /						# JAVA 反编译软件
### COPY meldmerge.dmg /							# 文件对比软件
### COPY navicat120_mysql_en.dmg /					# navicat mysql
### COPY smartgit-macosx-18_1_5.dmg /   			# SmartGit									# 0bbd4e8d6452
### COPY apache-jmeter-4.0.zip /   					# Jmeter						
### COPY apache-maven-3.6.1-bin.zip /   			# maven			
### COPY apache-tomcat-8.5.32.zip /   				# tomcat									# 7f48f733425c
### COPY AppCleaner_3.4.zip /						# 卸载软件
### COPY DropboxInstaller.dmg /						# Dropbox
### COPY robo3t-1.2.1-darwin-x86_64-3e50a65.dmg /	# mongodb 客户端								# 7ebe8dfbd7ea
### COPY CLion-2019.1.4.dmg /						# Jetbrains CLion for Mac
### COPY CLion-2019.1.4.tar.gz /					# Jetbrains CLion for Linux
### COPY ideaIU-2019.1.4.tar.gz /					# Jetbrains IDEA for Linux
### COPY WebStorm-2019.1.4.tar.gz /					# Jetbrains WebStorm for Linux
### COPY pycharm-professional-2019.1.4.dmg /		# Jetbrains Pycharm for Mac 				# 破解文件无效
### COPY pycharm-professional-2019.1.4.tar.gz /		# Jetbrains Pycharm for Linux 				# 破解文件无效
### COPY jetbrains-agent.jar /						# Jetbrains 2019.1.4 and 2019.1.3 破解文件 	# 6ec445e95532
### COPY pycharm-professional-2019.1.3.dmg /		# Jetbrains Pycharm 2019.1.3 for Mac
### COPY pycharm-professional-2019.1.3.tar.gz /		# Jetbrains Pycharm 2019.1.3 for Linux 		# 8beded7d49d6
# 由于 COM 协议的广泛使用，很多设备虽然接口改为了 USB，但内部数据通讯协议仍然使用的是 COM(即传统的 RS232 串口协议，新的使用 TTL)。
# 很多设备使用了 PL2302/CH340/FTDI 等芯片来通过USB模拟出串口协议，如 Arduino/NodeMCU 等都采用类似的机制
### COPY CH341SER_MAC.ZIP / 							# CH341 串口驱动
### COPY PL2303_MacOSX_v1_5_1_20160309.zip /			# PL2303 串口驱动		# 3308f9bce089
# 16进制文本编辑器, 破解参考 ultraedit_crack.txt
### COPY UltraEdit_18.00.0.66.dmg /						# UltraEdit 		# 990c253e73ac
# VMware Fusion Pro 11 for Mac: XKZYV-PK9CC-A1Y0X-K5HZL-Y65ZV
### COPY fusion.11.sn.dmg /
### COPY VirtualBox-6.0.10-132072-OSX.dmg / 				# 1666bd25971f
# Adobe Photo CC 2018, 破解参考 photo-crack.txt
### COPY AdobePhotoshop19-mul.dmg /  							
### COPY PHOTOSHOP_2017+2018_MAC版破解.zip /  				# 02a6cc9ef598		
# Microsoft Office
### COPY Microsoft_Office_2016_Installer.pkg / 				# 1e65cc010c12
# Microsoft Office 破解
### COPY MAC_OFFICE破解_FWMSO2016VLU2.0.dmg / 				# 630b544280a5
# Charles 4.2.7 破解文件
### COPY charles-4.2.7_破解文件.jar /							# 6b37b29c847e
# SecureCRT 工具
### COPY scrt-7.3.7-1034.osx_x64.dmg /	
# SecureCRT 破解文件
### COPY securecrt_mac_crack.pl /							# b46a19d25581
# Mac 虚拟光驱软件
### COPY DAEMON+Tools41227.dmg /  # f1f44c80a24e

# docker build . -t 'chunhui2001/clouddisk:mac'
# docker run -dit --entrypoint="top" --name clouddisk_mac chunhui2001/clouddisk:mac
# docker push chunhui2001/clouddisk:mac
# docker pull chunhui2001/clouddisk:mac
# docker cp clouddisk_golang:/jdk-8u211-linux-i586.tar.gz ~/Desktop/
# docker exec -it clouddisk_mac ls -al / | grep -E -i ".dmg|.tar.gz|.jar|.zip|.pkg" 				# 根据扩展名筛选
# docker exec -it clouddisk_mac ls -al / | grep -E -i ".dmg|.tar.gz|.pkg|.jar|.zip|.ZIP|.pl" | wc -l 		# 统计行数

# 将镜像ubuntu:15.10标记为 runoob/ubuntu:v3 镜像。
# docker tag ubuntu:15.10 runoob/ubuntu:v3

# 查看指定镜像被哪个镜像依赖
# docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=指定的镜像id -q)

# 清楚 docker 垃圾
# docker system prune --volumes

# ENTRYPOINT ["top"]
# CMD ["top"]

