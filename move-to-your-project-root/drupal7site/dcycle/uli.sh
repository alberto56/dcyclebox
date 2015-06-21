#!/bin/sh
#
# Gets a one-time login link to a container
# Usage:
# (1) make sure you have docker installed (on Mac, you can install a CoreOS vagrant box
#     which has docker pre-installed)
# (2) run ./scripts/fillactive/deploy.sh to get a development environment.
# (3) run ./scripts/fillactive/uli.sh to get a one-time login link to the environment.
#
# set -e makes sure that this script will fail if any of its lines fail
set -e

docker exec $(./scripts/fillactive/container.sh) /bin/bash -c 'cd /var/www/html && drush uli'
