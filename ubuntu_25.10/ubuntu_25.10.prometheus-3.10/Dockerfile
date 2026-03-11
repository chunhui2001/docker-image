# chunhui2001/ubuntu_25.10:prometheus-3.10
# Version 0.0.1
FROM chunhui2001/ubuntu_25.10:golang_1.26
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version
# uname -a

ENV PROMETHEUS_VERSION=3.10.0

RUN \
curl -L https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz > \
/usr/local/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz &&\
tar -zxvf /usr/local/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz -C /usr/local/ && \
cp /usr/local/prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus /usr/local/bin/ && \
cp /usr/local/prometheus-${PROMETHEUS_VERSION}.linux-amd64/promtool /usr/local/bin/ && \
mkdir /etc/prometheus && cp -r /usr/local/prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus.yml /etc/prometheus/prometheus.yml && \
rm -rf /usr/local/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz /usr/local/prometheus-${PROMETHEUS_VERSION}.linux-amd64

WORKDIR /root

# docker build --platform linux/amd64 -f Dockerfile . -t 'chunhui2001/ubuntu_25.10:prometheus-3.10'
# docker run --platform linux/amd64 -dit --entrypoint="top" -P --name rust-1.90 chunhui2001/ubuntu_25.10:prometheus-3.10
# docker run -dit -p 8080:8080 --name prometheus-3.10 chunhui2001/ubuntu_25.10:prometheus-3.10
# docker push chunhui2001/ubuntu_25.10:prometheus-3.10
# docker pull chunhui2001/ubuntu_25.10:prometheus-3.10

# Open ports
# EXPOSE 80



