# chunhui2001/ubuntu_25.10:etcd-3.6.8
# Version 0.0.1
FROM chunhui2001/ubuntu_25.10:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV ETCD_VER=v3.6.8


RUN curl -L \
"https://github.com/etcd-io/etcd/releases/download/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz" > \
/usr/local/etcd-${ETCD_VER}-linux-amd64.tar.gz &&\
tar -xvf /usr/local/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /usr/local/ &&\
ln -s /usr/local/etcd-${ETCD_VER}-linux-amd64 /usr/local/etcd &&\
rm -rf /usr/local/etcd-${ETCD_VER}-linux-amd64.tar.gz

ENV PATH="$PATH:/usr/local/etcd"

# docker build --platform linux/amd64 -f Dockerfile . -t 'chunhui2001/ubuntu_25.10:etcd-3.6.8'
# docker run -dit --entrypoint="top" --name etcd-3.6.8 chunhui2001/ubuntu_25.10:etcd-3.6.8
# docker push chunhui2001/ubuntu_25.10:etcd-3.6.8
# docker pull chunhui2001/ubuntu_25.10:etcd-3.6.8

# Open ports
EXPOSE 8080
