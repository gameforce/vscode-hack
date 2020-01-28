# TODO: Add puppet agentadd
# docker build -t ssh .
# docker run -d -p 2222:22 --name ssh -v ${HOME}:/opt --restart unless-stopped ssh
FROM centos:latest

RUN yum install -y openssh-server

RUN mkdir /var/run/sshd
RUN echo 'root:thx1138' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
RUN /usr/bin/ssh-keygen -A

CMD ["/usr/sbin/sshd", "-D"]
