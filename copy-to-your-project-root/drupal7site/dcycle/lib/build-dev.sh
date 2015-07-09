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
docker build -f="Dcycle-Dockerfile-drupal7site" -t $PROJECTNAME-dcycle-drupal7site .

# Kill the existing sites/default/settings.php
# sites/default/settings.php is on a volume that is shared between your host (for example
# your coreOS box), and the docker container. This is because the entire Drupal codebase
# is shared.
echo -e "[info] About to chmod sites/default from $(pwd)"
chmod -R u+w sites/default
rm -rf sites/default/settings.php

# Start a container on the selected port, make is persistent (-d), and share the current
# code base with /var/www/html on the container.
docker run -p $PORT:80 -d -v $(pwd):/var/www/html $PROJECTNAME-dcycle-drupal7site

echo -e "..."
echo -e "Please run ./dcycle/install.sh $PROJECTNAME-dcycle-drupal7site"
echo -e "and then enable your site deployment module."
echo -e "..."

echo -e "[<<  ] End of script $0"
