# chunhui2001/clouddisk:mac_Porter
# Version 0.0.1
#FROM alpine
FROM 39f3fded435b
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# 卸载软件
### COPY AppCleaner_3.4.zip /soft/
# 解压软件
### COPY TheUnarchiver.zip /soft/
# 文件对比软件
### COPY meldmerge.dmg /soft/
# VPN
### COPY EasyConnect.dmg /soft/
### COPY Tunnelblick_3.7.8_build_5180.dmg /soft/
# 浏览器
### COPY Firefox-latest.dmg /soft/
### COPY googlechrome.dmg /soft/
# Postman
### COPY Postman-osx-7.2.2.zip /soft/
# 抓包工具
### COPY charles-proxy-4.2.7.dmg /soft/
# SecureCRT 工具
### COPY scrt-7.3.7-1034.osx_x64.dmg /soft/
# SecureCRT 破解文件
### COPY securecrt_mac_crack.pl /soft/
# 由于 COM 协议的广泛使用，很多设备虽然接口改为了 USB，但内部数据通讯协议仍然使用的是 COM(即传统的 RS232 串口协议，新的使用 TTL)。
# 很多设备使用了 PL2302/CH340/FTDI 等芯片来通过USB模拟出串口协议，如 Arduino/NodeMCU 等都采用类似的机制
# CH341 串口驱动
### COPY CH341SER_MAC.ZIP /soft/
# PL2303 串口驱动
### COPY PL2303_MacOSX_v1_5_1_20160309.zip /soft/
### COPY eclipse-jee-2019-09-R-macosx-cocoa-x86_64.dmg /soft/
### COPY jdk-8u231-macosx-x64.dmg /soft/
### COPY smartgit-macosx-19_1_4.dmg /soft/ 								# 3698b5a41d9a
# Mac OS Ngrok 客户端
### COPY ngrok-stable-darwin-amd64.zip /soft/								
### COPY SwitchHosts._macOS_3.4.0.5450.dmg /soft/				
# mac 熄屏软件			
### COPY InsomniaX-2.1.8.tgz /soft/
### COPY VSCode-darwin-stable.zip /soft/                                # c9b011b3400a
### COPY Shimo_4.1.5.1_8837.zip /soft/  	# 57484febdf83
### COPY VisualVM_144.dmg /soft/		# 39f3fded435b

# docker build . -t 'chunhui2001/clouddisk:mac_Porter'
# docker run -dit --entrypoint="top" --name clouddisk_mac_Porter chunhui2001/clouddisk:mac_Porter
# docker push chunhui2001/clouddisk:mac_Porter
# docker pull chunhui2001/clouddisk:mac_Porter
# docker cp clouddisk_golang:/jdk-8u211-linux-i586.tar.gz ~/Desktop/
# docker exec -it clouddisk_mac ls -al / | grep -E -i ".dmg|.tar.gz|.jar|.zip|.pkg" 				# 根据扩展名筛选
# docker exec -it clouddisk_mac ls -al / | grep -E -i ".dmg|.tar.gz|.jar|.zip|.pl" | wc -l 		# 统计行数

# 将镜像ubuntu:15.10标记为 runoob/ubuntu:v3 镜像。
# docker tag ubuntu:15.10 runoob/ubuntu:v3

# 查看指定镜像被哪个镜像依赖
# docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=指定的镜像id -q)

# ENTRYPOINT ["top"]
# CMD ["top"]

