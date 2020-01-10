# chunhui2001/ubuntu_25.10:zh-CN
FROM ubuntu:25.10
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version
# uname -a

### Install dev tools
RUN apt-get update -y && \
apt-get install -y --no-install-recommends \
curl git pkg-config libssl-dev clang nettle-dev \
cmake libsasl2-dev binutils libvips-dev fakeroot \
libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev \
liblz4-dev libzstd-dev devscripts debhelper g++ \
exiftool vim build-essential lsb-release net-tools \
iputils-ping apt-utils wget fonts-wqy-microhei \
locales iproute2 && apt-get clean && \
rm -rf /var/lib/apt/lists/* && apt-get autoclean && \
# 生成中文语言环境
locale-gen zh_CN.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV LC_ALL=zh_CN.UTF-8

# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN cat <<'EOF' >> /root/.vimrc
set nocompatible              " be iMproved, required
set encoding=utf-8 			  " 一打开就有中文界面或 UTF-8 支持
set fileencodings=utf-8,gbk,gb2312,cp936

filetype off                  " required
filetype plugin indent on     " 默认启用文件类型检测（自动缩进、语法规则等）

syntax on                     " 启用语法高亮
set tabstop=4                 " 一个 Tab = 4 个空格
set softtabstop=4             " 退格时回退 4 个空格
set shiftwidth=4              " 缩进宽度 4
set expandtab                 " 用空格代替 Tab
set nu                        " 显示行号
set hlsearch                  " 高亮搜索
set cursorline                " 高亮当前行
hi CursorLine term=none cterm=BOLD
hi CursorLineNR cterm=BOLD ctermbg=brown ctermfg=cyan
EOF

WORKDIR /root

# docker build --platform linux/amd64 -f Dockerfile . -t 'chunhui2001/ubuntu_25.10:zh-CN'
# docker run -dit --entrypoint="top" -P --name ubuntu25.10 chunhui2001/ubuntu_25.10:zh-CN
# docker run -dit -p 8080:8080 --name ubuntu25.10 chunhui2001/ubuntu_25.10:zh-CN
# docker push chunhui2001/ubuntu_25.10:zh-CN
# docker pull chunhui2001/ubuntu_25.10:zh-CN

# Open ports
# EXPOSE 80
