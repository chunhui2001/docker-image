# chunhui2001/ubuntu_25.10:nginx_1.28.0
# Version 0.0.1
FROM chunhui2001/ubuntu_24.04:zh-CN
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

# copy nginx_work folder
COPY nginx-work /root/nginx-work

# extract files
WORKDIR /root/nginx-work
RUN tar -zxf lua-nginx-module-0.10.29.tar.gz && \
tar -zxf nginx-1.28.0.tar.gz && \
tar -zxf ngx_devel_kit-v0.3.0.tar.gz && \
tar -zxf zlib-1.2.8.tar.gz && \
tar -zxf openssl-3.0.17.tar.gz && \
ln -s /usr/lib/x86_64-linux-gnu/liblua5.1.so /usr/lib/liblua.so && ldconfig

WORKDIR /root/nginx-work/luajit2
RUN make -j$(nproc) && make install

# LuaJIT 动态库找不到
# > LuaJIT 编译好了，但系统在运行 NGINX 时找不到它的 .so 库。
# 检查：
# ldd /usr/local/nginx/sbin/nginx | grep luajit
# > 如果输出为空，说明 NGINX 运行时没链接上 LuaJIT。

## 确保 nginx 和 libluajit-5.1.so 架构一致：
# ls /usr/local/lib/libluajit-5.1.so*
# file /usr/local/nginx/sbin/nginx
# file /usr/local/lib/libluajit-5.1.so.2
# 两者都应是：
# > ELF 64-bit LSB executable, x86-64

# 否则重新编译 LuaJIT：
# make CC="gcc -m64"

ENV LUAJIT_LIB=/usr/local/lib
ENV LUAJIT_INC=/usr/local/include/luajit-2.1
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
#ENV LUAJIT_MMAP_LOW=1
#ENV CC="gcc -m64"

# install nginx
WORKDIR /root/nginx-work/nginx-1.28.0

RUN ../configure.sh && make && make install

RUN ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/nginx

RUN mkdir -p /usr/local/share/lua/5.1/resty
RUN cp -r /root/nginx-work/lua-resty-core/lib/resty/* /usr/local/share/lua/5.1/resty/
RUN cp -r /root/nginx-work/lua-resty-lrucache/lib/resty/* /usr/local/share/lua/5.1/resty/

# add nginx user
RUN useradd -r nginx && usermod -s /sbin/nologin nginx

WORKDIR /root/nginx-work/

# copy mime.types file to /usr/local/nginx
RUN cp mime.types /usr/local/nginx/mime.types

# update nginx.conf /usr/local/nginx/conf/nginx.conf
COPY nginx.sample.nginx.conf /usr/local/nginx/conf/nginx.conf

# add sites-enabled/default
COPY nginx.sample.default /usr/local/nginx/sites-enabled/default

# add index.html /usr/local/nginx/html/
COPY index.html /usr/local/nginx/html/index.html

# use sed to update index.html
RUN sed -i "s#%%DATE%%#`date -d today +"%Y-%m-%d %H:%M:%S.%s"`#g" /usr/local/nginx/html/index.html

# run nginx with daemon off 
ENTRYPOINT ["nginx", "-g", "daemon off;"]

# remove /root/nginx-work
WORKDIR /root
RUN rm -rf /root/nginx-work

# CMD ["-g", "daemon off;"]

# nginx -v 查看版本 
# nginx -V 查看编译配置
# nginx -t 检查配置文件

### run nginx
# docker build --platform linux/amd64 --memory=4g -f Dockerfile . -t 'chunhui2001/ubuntu_25.10:nginx_1.28.0'
# docker run --network host -m 4g --platform linux/amd64 -dit --entrypoint="top" -P --name nginx_1.28.0 chunhui2001/ubuntu_25.10:nginx_1.28.0

# docker push chunhui2001/ubuntu_25.10:nginx_1.28.0
# docker pull chunhui2001/ubuntu_25.10:nginx_1.28.0

# $ docker run -d -p 8081:80 -v /Users/keesh/Desktop/react_lab:/usr/local/nginx/html:ro --name nginx_react chunhui2001/ubuntu_25.10:nginx_1.28.0
# $ docker run -d -p 80:80 --name nginx_server chunhui2001/ubuntu_25.10:nginx_1.28.0
# $ docker run --rm --name webserver -p 80:80 -v /var/www:/usr/share/nginx/html:ro -d nginx

# open port
EXPOSE 80


