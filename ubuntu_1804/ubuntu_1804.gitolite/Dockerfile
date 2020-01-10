# chunhui2001/ubuntu_1804:gitolite
# Version 0.0.1
FROM chunhui2001/ubuntu_1804:apache24
MAINTAINER Chunhui.Zhang "chunhui2001@gmail.com"

RUN apt-get update -y
RUN apt-get install -y openssh-server git ssh libc6-i386 lib32gcc1 lib32z1 lib32stdc++6 supervisor gitweb

RUN adduser --system --shell /bin/bash --gecos 'git administrator' --group --disabled-password --home /home/admin admin
RUN adduser --system --shell /bin/bash --gecos 'git version control' --group --disabled-password --home /home/git git
RUN adduser git ssh

RUN mkdir /var/run/sshd
RUN echo 'root:screencast2' | chpasswd

USER git
WORKDIR /home/git
RUN git clone git://github.com/sitaramc/gitolite /home/git/gitolite
RUN mkdir /home/git/bin && gitolite/install -ln

USER admin
WORKDIR /home/admin
RUN yes /home/admin/.ssh/id_rsa | ssh-keygen -t rsa -N ''
RUN eval `ssh-agent -s`
RUN echo 'IdentityFile /home/admin/.ssh/id_rsa' > /home/admin/.ssh/config

USER root
#RUN ssh-copy-id /home/admin/.ssh/id_rsa.pub git@127.0.0.1
RUN cat /home/admin/.ssh/id_rsa.pub > /home/git/Git-Admin.pub
RUN chown git:git /home/git/Git-Admin.pub

USER git
WORKDIR /home/git
RUN bin/gitolite setup -pk Git-Admin.pub

USER root
RUN usermod -a -G git www-data
RUN chmod g+r /home/git/projects.list
RUN chmod -R g+rx /home/git/repositories



# docker build . -t 'chunhui2001/ubuntu_1804:gitolite'
# docker run -dit --entrypoint="top" --name gitolite chunhui2001/ubuntu_1804:gitolite
# docker push chunhui2001/ubuntu_1804:gitolite
# docker pull chunhui2001/ubuntu_1804:gitolite

# Open ports
EXPOSE 22


