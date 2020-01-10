# chunhui2001/ubuntu_24.04:zh-CN
FROM ubuntu:24.04
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version
# uname -a

ENV DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC

### Install dev tools
RUN apt-get update -y && \
apt-get install -y --no-install-recommends \
apt-utils autoconf binutils build-essential clang cmake curl debhelper devscripts exiftool fakeroot fonts-wqy-microhei g++ git iproute2 iputils-ping libatomic-ops-dev libbz2-dev libcurl4-gnutls-dev libgd-dev libgeoip-dev libgflags-dev liblua5.1-0 liblua5.1-0-dev liblz4-dev libpam-dev libpcre3 libpcre3-dev libperl-dev libreadline6-dev libsasl2-dev libsnappy-dev libssl-dev libvips-dev libxml2 libxml2-dev libxslt-dev libzstd-dev locales lsb-release lua5.1 net-tools nettle-dev openssl pkg-config vim wget zlib1g zlib1g-dev && \
apt-get clean && \
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

# ngx_http_lua_module 0.10.x 只支持 LuaJIT 2.x，Lua 5.x 不支持。
# 确认 luajit -v 输出的是 2.x
# luajit -v

WORKDIR /root

# docker build --platform linux/amd64 -f Dockerfile . -t 'chunhui2001/ubuntu_24.04:zh-CN'
# docker run -dit --entrypoint="top" -P --name ubuntu24.04 chunhui2001/ubuntu_24.04:zh-CN
# docker run -dit -p 8080:8080 --name ubuntu24.04 chunhui2001/ubuntu_24.04:zh-CN
# docker push chunhui2001/ubuntu_24.04:zh-CN
# docker pull chunhui2001/ubuntu_24.04:zh-CN

# Open ports
# EXPOSE 80
