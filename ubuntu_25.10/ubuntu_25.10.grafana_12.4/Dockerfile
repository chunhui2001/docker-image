# chunhui2001/ubuntu_25.10:grafana_12.4
# Version 0.0.1
FROM chunhui2001/ubuntu_25.10:golang_1.26
#MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

### 查看系统版本
# cat /etc/issue
### Linux内核版本
# cat /proc/version
# uname -a

ENV GRAFANA_VERSION=12.4.1

WORKDIR /root

# Downloading Grafana Binaries    
ADD https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz /root
#RUN addgroup grafana && adduser -s /bin/false -G grafana -S -D grafana

RUN tar -C . -xzf grafana-$GRAFANA_VERSION.linux-amd64.tar.gz && \
        mv grafana-${GRAFANA_VERSION} /opt/grafana && \
        mkdir -p /var/lib/grafana/dashboards /var/lib/grafana/data /var/lib/grafana/logs /var/lib/grafana/plugins && \
        ln -s /var/lib/grafana/plugins /opt/grafana/plugins && \
        mv /opt/grafana/bin/* /usr/bin/ && \
        grafana-cli plugins update-all && \
        rm -f grafana-$GRAFANA_VERSION.linux-amd64.tar.gz

# docker build --platform linux/amd64 -f Dockerfile . -t 'chunhui2001/ubuntu_25.10:grafana_12.4'
# docker run --platform linux/amd64 -dit --entrypoint="top" -P --name grafana_12.4 chunhui2001/ubuntu_25.10:grafana_12.4
# docker run -dit -p 8080:8080 --name prometheus-3.10 chunhui2001/ubuntu_25.10:grafana_12.4
# docker push chunhui2001/ubuntu_25.10:grafana_12.4
# docker pull chunhui2001/ubuntu_25.10:grafana_12.4

# Open ports
# EXPOSE 80



