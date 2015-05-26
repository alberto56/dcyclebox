#!/bin/sh
# set -e makes sure that this script will fail if any of its lines fail
set -e

# Start by building the box
docker build -t dcyclebox-test .

# Test curl
docker run dcyclebox-test bash -c 'which curl'
echo '[test] curl works'

# Test nginx
docker run dcyclebox-test bash -c 'nginx -v'
echo '[test] nginx is installed'
docker run dcyclebox-test bash -c 'service nginx start && curl http://localhost'
echo '[test] webserver is running'

# Test PHP
docker run dcyclebox-test bash -c 'php -v'
echo '[test] php works'

# Test sqlite3
docker run dcyclebox-test bash -c 'sqlite3 -version'
echo '[test] sqlite3 works'

# Test drush
docker run dcyclebox-test bash -c 'drush version'
echo '[test] drush works'

# Test drupal
docker run dcyclebox-test bash -c 'cat /drupal/index.php | grep drupal'
echo '[test] drupal root accessible through the command line'
docker run dcyclebox-test bash -c 'service nginx start && curl http://localhost | grep Drupal'
echo '[test] Drupal running

echo '[status] end of test script'
