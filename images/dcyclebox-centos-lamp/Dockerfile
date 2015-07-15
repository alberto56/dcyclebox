# Note: yum clean all was added to all yum lines because of
#       https://github.com/CentOS/sig-cloud-instance-images/issues/15

FROM centos:6.6
MAINTAINER Albert Albala, based on code from Thatcher Peskens <thatcher@koffiedik.net> at https://github.com/dockerfiles/centos-lamp

# install http
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# install httpd
RUN yum -y install httpd vim-enhanced bash-completion unzip; yum clean all

# install mysql
RUN yum install -y mysql mysql-server; yum clean all
RUN echo "NETWORKING=yes" > /etc/sysconfig/network
# start mysqld to create initial tables
RUN service mysqld start

# install php
RUN yum install -y php php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml; yum clean all

# install supervisord
RUN yum install -y python-pip && pip install "pip>=1.4,<1.5" --upgrade; yum clean all
RUN pip install supervisor

# install sshd
RUN yum install -y openssh-server openssh-clients passwd; yum clean all

RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config && echo 'root:changeme' | chpasswd

ADD phpinfo.php /var/www/html/
ADD supervisord.conf /etc/
EXPOSE 22 80
CMD ["supervisord", "-n"]
