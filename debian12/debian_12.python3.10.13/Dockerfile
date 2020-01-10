# chunhui2001/debian_12:python3.10.3
# Version 0.0.1
FROM python:3.10.13
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
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh
ENV LC_ALL zh_CN.UTF-8

RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8

RUN python3 -m pip install --upgrade pip

ADD uwsgi-2.0.23.tar.gz2 /root/
ADD requirements.txt /root/requirements.txt

RUN pip3 install -r /root/requirements.txt
RUN python3 -m pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir gunicorn && mkdir -p /var/log/gunicorn

WORKDIR /root/uwsgi-2.0.23
RUN python setup.py install

# put files
ADD uwsgi.ini /root/uwsgi.ini
ADD www /www

WORKDIR /root

# tesseract --version
# python --version
# uwsgi --version

ENTRYPOINT ["uwsgi", "--ini", "/root/uwsgi.ini", "--thunder-lock"]

# docker build -f Dockerfile . -t 'chunhui2001/debian_12:python3.10.3'
# docker run -dit --entrypoint="top" -P --name python3.10.3 chunhui2001/debian_12:python3.10.3
# docker run -dit -p 5000:5000 --name python3.10.3 chunhui2001/debian_12:python3.10.3
# docker push chunhui2001/debian_12:python3.10.3
# docker pull chunhui2001/debian_12:python3.10.3

