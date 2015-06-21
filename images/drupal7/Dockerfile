FROM dockerfiles/centos-lamp
MAINTAINER Dcycle, Inc.

# Install git
RUN yum -y install git; yum clean all;

# Install composer and drush
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require drush/drush:6.6.0
RUN ln -s /.composer/vendor/drush/drush/drush /bin/drush

# Install Drupal database
RUN service mysqld start && echo 'create database drupal' | mysql -uroot

# Install sendmail
RUN yum -y install sendmail; yum clean all;

# Install clean urls & increase memory
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/httpd/conf/httpd.conf
RUN sed -i 's/memory_limit = 128M/memory_limit = 512M/g' /etc/php.ini
RUN apachectl restart

# Incerase max_allowed_packets
ADD ./scripts/fillactive/docker-files/my.cnf /etc/my.cnf
