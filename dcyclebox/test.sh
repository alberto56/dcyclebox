#!/bin/sh
# set -e makes sure that this script will fail if any of its lines fail
set -e

# Start by building the box
docker build -t dcyclebox-test .

# Test nginx
docker run dcyclebox-test bash -c 'nginx -v'
echo '[test] nginx works'

echo '[status] end of test script'
