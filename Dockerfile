# docker with puppet agent and ssh server
FROM centos:latest

# install puppet and openssh
RUN rpm -Uvh https://yum.puppet.com/puppet5-release-el-8.noarch.rpm
RUN yum -y update
RUN yum install -y openssh-server
RUN yum -y install puppet

# setup login
RUN mkdir /var/run/sshd
RUN echo 'root:thx1138' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# setup port and ssh key
EXPOSE 22
RUN /usr/bin/ssh-keygen -A

# start ssh server
CMD ["/usr/sbin/sshd", "-D"]
