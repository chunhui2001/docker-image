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

## 验证版本
# nats-server -v

# 默认会在 4222 端口启动 TCP 服务。
ENTRYPOINT ["./nats-server", "-c", "nats-server.conf"]

# docker build -f Dockerfile . -t 'chunhui2001/ubuntu_20.04_dev:nats-v2.12'
# docker run --platform linux/amd64 -dit --entrypoint="top" -P --name nats-v2.12 chunhui2001/ubuntu_20.04_dev:nats-v2.12
# docker run -dit -p 4222:4222 -p 8222:8222 --name nats-v2.12 chunhui2001/ubuntu_20.04_dev:nats-v2.12
# docker push chunhui2001/ubuntu_20.04_dev:nats-v2.12
# docker pull chunhui2001/ubuntu_20.04_dev:nats-v2.12

# Open ports
# EXPOSE 80



