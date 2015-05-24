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
docker run dcyclebox-test bash -c 'service nginx start && curl http://localhost | grep "Welcome to nginx!"'
echo '[test] webserver is running'

echo '[status] end of test script'
