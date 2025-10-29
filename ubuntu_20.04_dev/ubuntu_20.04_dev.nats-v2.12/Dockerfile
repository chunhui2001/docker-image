# chunhui2001/ubuntu_20.04_dev:nats-v2.12
# Version 0.0.1
FROM chunhui2001/ubuntu_20.04_dev:zh-CN
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version
# uname -a

### Install dev tools
RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl git pkg-config libssl-dev clang nettle-dev cmake libsasl2-dev binutils libvips-dev fakeroot libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev libzstd-dev devscripts debhelper g++ exiftool
RUN apt-get clean && apt-get autoclean

# https://docs.nats.io/running-a-nats-service/introduction/installation
RUN curl -fsSL https://binaries.nats.dev/nats-io/nats-server/v2@v2.12.1 | sh

COPY ./nats-server.conf /root/nats-server.conf


ENV GOLANG_VERSION=1.25.3

RUN curl -L "https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz" > /usr/local/go${GOLANG_VERSION}.linux-amd64.tar.gz &&\
tar -xvf /usr/local/go${GOLANG_VERSION}.linux-amd64.tar.gz -C /usr/local/ &&\
mv /usr/local/go /usr/local/go${GOLANG_VERSION}.linux-amd64 &&\
ln -s /usr/local/go${GOLANG_VERSION}.linux-amd64 /usr/local/go &&\
rm -rf /usr/local/go${GOLANG_VERSION}.linux-amd64.tar.gz

ENV PATH="$PATH:/usr/local/go/bin"
RUN go install github.com/nats-io/natscli/nats@latest
ENV PATH="$PATH:/root/go/bin"

### 常用命令速查表
# | 操作           	 	| 命令                                  		|
# | ------------------- | -----------------------------------------	|
# | 发布消息         	| `nats pub subject "msg"`                 	|
# | 订阅消息         	| `nats sub subject`                       	|
# | 测试连接         	| `nats ping`                              	|
# | 查看服务器状态   	 	| `nats server check`                      	|
# | 创建 stream    	 	| `nats stream add`                        	|
# | 查看 stream 列表 	| `nats stream ls`                         	|
# | 查看 stream 详情 	| `nats stream info <name>`                	|
# | 创建 consumer  	 	| `nats consumer add <stream> <name>`      	|
# | 拉取消息         	| `nats consumer next <stream> <consumer>` 	|
# | 删除 stream    	 	| `nats stream rm <name>`                  	|

## nats-cli
# check the connection to the server
# $ nats server check connection -s nats://0.0.0.0:4222

## start a subscriber using the nats CLI tool:
# $ nats subscribe ">" -s nats://0.0.0.0:4222
# $ nats sub -s nats://server:port ">"

## publish your first message:
# $ nats pub hello world -s nats://0.0.0.0:4222



# 默认会在 4222 端口启动 TCP 服务。
ENTRYPOINT ["./nats-server", "-c", "nats-server.conf"]

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:nats-v2.12'
# docker run --platform linux/amd64 -dit --entrypoint="top" -P --name nats-v2.12 chunhui2001/ubuntu_20.04_dev:nats-v2.12
# docker run -dit -p 4222:4222 --name nats-v2.12 chunhui2001/ubuntu_20.04_dev:nats-v2.12
# docker push chunhui2001/ubuntu_20.04_dev:nats-v2.12
# docker pull chunhui2001/ubuntu_20.04_dev:nats-v2.12

# Open ports
# EXPOSE 80



