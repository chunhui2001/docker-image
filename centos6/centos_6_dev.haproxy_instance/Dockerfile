# chunhui2001/centos_6_dev:haproxy_instance
# Version 0.0.1
FROM chunhui2001/centos_6_dev:haproxy_base
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ENV REFRESHED_AT 2017-11-10

RUN service haproxy start && service haproxy stop

ADD haproxy.cfg.default /etc/haproxy/haproxy.cfg

ENTRYPOINT ["haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-p", "/var/run/haproxy.pid"]

#CMD ["-p /var/run/haproxy.pid"]

EXPOSE 80


