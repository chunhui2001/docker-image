# chunhui2001/debian_10:python3.8.6.mpl
# Version 0.0.1
FROM matplotlib/mpl-docker:latest
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version 
# uname -a

### Install dev tools
RUN apt-get -qq update -y && \
	apt-get install -y vim build-essential lsb-release net-tools iputils-ping wget ttf-wqy-microhei locales iproute2 \
    && rm -rf /var/lib/apt/lists/*

# 清理无用的包
RUN apt-get clean && apt-get autoclean
# 检查是否有损坏的依赖
RUN apt-get check  	

# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 开启中文支持
RUN locale-gen zh_CN.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN locale-gen zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh
ENV LC_ALL zh_CN.UTF-8

RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
RUN python3 -m pip install --upgrade pip
RUN pip install matplotlib
RUN pip install mplfinance

WORKDIR /root

# docker build -f Dockerfile . -t 'chunhui2001/debian_10:python3.8.6.mpl'
# docker run -dit --entrypoint="top" -P --name mpl chunhui2001/debian_10:python3.8.6.mpl
# docker run -dit -p 8080:8080 --name mpl chunhui2001/debian_10:python3.8.6.mpl
# docker push chunhui2001/debian_10:python3.8.6.mpl
# docker pull chunhui2001/debian_10:python3.8.6.mpl

# Open ports
# EXPOSE 80
