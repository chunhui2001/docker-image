# chunhui2001/clouddisk:keil5
# Version 0.0.1
# FROM alpine
FROM dec45bac46e3
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# curl 下载文件
# sudo curl -L -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
# sudo chmod a+rx /usr/local/bin/youtube-dl

# stm32、keil、tbox、uboot、code4、 code2、 crc、jlink, jlink4.12驱动
### COPY keil开发环境.zip /soft/
### COPY keil开发环境_Keil_ARM_MDK_5.25_兼容keil4和keil5.zip /soft/
### COPY keil界面截图.zip /soft/
### COPY 2.0烧写工具带出厂boot.zip /soft/
### COPY 4.0烧写工具带boot工程.zip /soft/
### COPY code2.0_20191011.zip /soft/
### COPY code4.0_20190912.zip /soft/
# keil5 这个文件被移除了，从 keil4 复制出来的放到了这里: C:\Keil_v5\ARM\ARMCC\include\absacc.h
### COPY absacc.h /soft/
### COPY 接线图.jpg /soft/
### COPY 串口工具_XCOM_V2.0.exe /soft/
### COPY 工程说明_keil_readme.txt /soft/
### COPY 电路原理图OBD_GSM_V2.1.pdf /soft/
### COPY TBOX串口启动日志.txt /soft/
# 陈善柏的 JLink 驱动 for Keil4
### COPY Jlink驱动4.12.rar /soft/
### COPY 汇编入门.png /soft/ 					# 49e57113a53d
### COPY STM32-Discovery-Package_en.stsw-stm32078_示例项目模版.zip /soft/ 			# 11c3875e26c6
# stm32 工程模版1
### COPY ["STM32 tutorial part.1 - Set up a project in KEIL μVision-_QXoTNP9GIw.mp4", "/soft/"] 
# stm32 工程模版2
### COPY ["How to create a new project in Keil uVision 5-BotKqf8zaiw.mp4", "/soft/"] 
# stm32 LED Blinky STM32CubeMx
### COPY ["STM32F4 Programming in C 1- LED Blinky coding in Keil using STM32CubeMx-J--98xEMvtE.mp4", "/soft/"]  	# dec45bac46e3


# docker build . -t 'chunhui2001/clouddisk:keil5'
# docker run -dit --entrypoint="top" --name clouddisk_keil5 chunhui2001/clouddisk:keil5
# docker push chunhui2001/clouddisk:keil5
# docker pull chunhui2001/clouddisk:keil5


# 查看指定镜像被哪个镜像依赖
# docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=指定的镜像id -q)

ENTRYPOINT ["top"]

