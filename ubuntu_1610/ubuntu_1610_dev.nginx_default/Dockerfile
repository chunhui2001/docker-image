# chunhui2001/ubuntu_1610_dev:nginx_default
# Version 0.0.1
FROM chunhui2001/ubuntu_1610_dev:zh-CN
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

ARG hname=`hostname`

# Install Nginx
RUN apt-get update && apt-get install -yqq nginx 

# Add nginx conf file
ADD nginx.sample.nginx.conf /etc/nginx/nginx.conf
ADD nginx.sample.default /etc/nginx/sites-available/default

# Add and update index.html
# ONBUILD ADD index.html /var/www/html/index.html
ADD index.html /var/www/html/index.html

RUN sed -i "s#%%DATE%%#`date -d today +"%Y-%m-%d %H:%M:%S.%s"`#g" /var/www/html/index.html


ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/usr/sbin/nginx"]
# CMD ["-h"]
CMD ["-g", "daemon off;"]

# Open ports 
EXPOSE 80 
