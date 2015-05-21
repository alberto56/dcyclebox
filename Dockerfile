FROM ubuntu:14.04.2
MAINTAINER alberto56, Dcycle Inc. https://github.com/dcycleproject/dcyclebox

# See http://askubuntu.com/questions/222348
RUN apt-get update -y

# Install curl
RUN apt-get -y install curl

# Install Nginx webserver
RUN apt-get -y install nginx
