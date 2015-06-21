#!/bin/sh
#
# Deploys a complete development environment.
# Usage:
# (1) make sure you have docker installed (on Mac, you can install a CoreOS vagrant box
#     which has docker pre-installed)
# (2) run ./scripts/fillactive/deploy.sh to get a development environment.
# (3) visit the IP address of your computer or core os vagrant box.
# (4) start developing
#
# set -e makes sure that this script will fail if any of its lines fail
set -e

# Start by building the box
docker build -t fillactive .

# Kill the existing sites/default/settings.php
# sites/default/settings.php is on a volume that is shared between your host (for example
# your coreOS box), and the docker container. This is because the entire Drupal codebase
# is shared.
chmod -R u+w sites/default
rm -rf sites/default/settings.php

# Start a container on port 80, make is persistent (-d), and share the current code
# base with /var/www/html on the container.
docker run -p 80:80 -d -v $(pwd):/var/www/html fillactive
# Find the currently running container, install a new drupal site based on the contents
# of the current repo, then enable the site deployment module to get a functional site.
docker exec $(./scripts/fillactive/container.sh) /bin/bash -c 'cd /var/www/html && php -d sendmail_path=`which true` /.composer/vendor/drush/drush/drush.php si -y --db-url=mysql://root:@localhost/drupal && cd /var/www/html && drush en fillactive_deploy -y'

echo '[status] end of deploy script'
