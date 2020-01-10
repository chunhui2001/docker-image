# chunhui2001/clouddisk:stm32
# Version 0.0.1
FROM alpine
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

COPY 洋桃100-视频 /soft/洋桃100-视频
COPY 洋桃100-视频示例程序 /soft/洋桃100-视频示例程序
COPY 洋桃100-README.txt /soft/洋桃100-README.txt
COPY STM32数据手册和参考手册 /soft/STM32数据手册和参考手册
COPY STM32F1_自建工程模版 /soft/STM32F1_自建工程模版
COPY STM32F10x_StdPeriph_Lib_V3.5.0.zip /soft/STM32F10x_StdPeriph_Lib_V3.5.0.zip
COPY STM32F103Z核心板配套资料_德飞莱.rar /soft/STM32F103Z核心板配套资料_德飞莱.rar

# docker build . -t 'chunhui2001/clouddisk:stm32'
# docker run -dit --entrypoint="top" --name clouddisk_stm32 chunhui2001/clouddisk:stm32
# docker push chunhui2001/clouddisk:stm32
# docker pull chunhui2001/clouddisk:stm32


# 查看指定镜像被哪个镜像依赖
# docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=指定的镜像id -q)

ENTRYPOINT ["top"]

