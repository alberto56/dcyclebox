FROM ubuntu:14.04.2
MAINTAINER alberto56, Dcycle Inc. https://github.com/dcycleproject/dcyclebox

# See http://askubuntu.com/questions/222348
# See https://docs.docker.com/articles/dockerfile_best-practices/#run
# Install curl
RUN apt-get update -y && apt-get -y install curl

# Install Nginx webserver
RUN apt-get -y install nginx

# Install PHP
RUN apt-get -y install php5

# Install sqlite3, which is required by drush
RUN apt-get -y install sqlite3

# Install composer and drush
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require drush/drush:dev-master
RUN ln -s /root/.composer/vendor/drush/drush/drush /bin/drush

# Install Drupal
RUN rm -rf /usr/share/nginx/html
RUN cd /usr/share/nginx && drush dl drupal-8.0.0-beta10 && mv drupal* html
RUN ln -s /usr/share/nginx/html drupal
