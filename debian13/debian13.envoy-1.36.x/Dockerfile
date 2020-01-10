# chunhui2001/debian_13:debian13.envoy-1.36.x
# Version 0.0.1
FROM envoyproxy/envoy:v1.36-latest
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version 
# uname -a

### Install dev tools
RUN apt-get -qq update -y && \
	apt-get install -y vim build-essential lsb-release net-tools iputils-ping wget ttf-wqy-microhei locales iproute2 \
	build-essential autoconf libssl-dev curl libcurl4-gnutls-dev zlib1g zlib1g-dev libxml2 libxml2-dev libxslt-dev \
	libreadline6-dev libpcre3 libpcre3-dev libssl-dev openssl libssl-dev libperl-dev libgd-dev libgeoip-dev \
	libpam-dev libatomic-ops-dev \
	make net-tools iputils-ping apt-utils supervisor wget \
	tesseract-ocr libgl1-mesa-dev libglib2.0-0 \
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
ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV LC_ALL=zh_CN.UTF-8

RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8


# docker build -f Dockerfile . -t 'chunhui2001/debian_13:debian13.envoy-1.36.x'
# docker run -dit --entrypoint="top" -P --name envoy-1.36.x chunhui2001/debian_13:debian13.envoy-1.36.x
# docker run -dit -p 5000:5000 --name envoy-1.36.x chunhui2001/debian_13:debian13.envoy-1.36.x
# docker push chunhui2001/debian_13:debian13.envoy-1.36.x
# docker pull chunhui2001/debian_13:debian13.envoy-1.36.x

