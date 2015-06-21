#!/bin/sh
#
# Prints the container ID if available.
# Usage:
# (1) make sure you have docker installed (on Mac, you can install a CoreOS vagrant box
#     which has docker pre-installed)
# (2) run ./scripts/fillactive/deploy.sh to get a development environment.
# (3) run ./scripts/fillactive/container.sh to get the hash of the running container,
#     which will look like 48af49e
docker ps|grep fillactive|sed s/[^a-z0-9].*$//
