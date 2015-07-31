#!/bin/sh
#
# Deploys a complete development environment.
# Usage:
# (1) make sure you have docker installed (on Mac, you can install a CoreOS vagrant box
#     which has docker pre-installed)
# (2) run ./dcycle/deploy.sh to get a development environment.
# (3) visit the IP address of your computer or core os vagrant box.
# (4) start developing
#
# set -e makes sure that this script will fail if any of its lines fail
set -e

PORT=$1
PROJECTNAME=$2

echo -e "[  >>] Start of script $0 (from $(pwd))"

# Start by building the box
docker build -f="Dcycle-Dockerfile-drupal6site-internal" -t $PROJECTNAME-dcycle-drupal6site-internal .

# Start a container on the selected port, make is persistent (-d), and share the current
# code base with /var/www/html on the container.
docker run -p $PORT:80 -d $PROJECTNAME-dcycle-drupal6site-internal

echo -e "[<<  ] End of script $0"
