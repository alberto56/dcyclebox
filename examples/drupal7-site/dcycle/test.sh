#!/bin/sh
#
# Effectue certains tests sur le Dockerfile a la racine de ce repertoire.
#
# Les simpletests ne sont pas faits ici; ce script teste uniquement le deploiement
# via Docker.
#
# set -e makes sure that this script will fail if any of its lines fail
set -e

# Start by building the box
docker build fillactive .

# Test Apache
docker run fillactive bash -c 'grep -i "DocumentRoot" /etc/httpd/conf/httpd.conf'
echo '[test] Apache root OK'

echo '[status] end of test script'
