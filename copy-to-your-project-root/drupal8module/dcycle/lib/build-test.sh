# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=$1
PROJECTNAME=$2

docker build -f="Dcycle-Dockerfile-drupal8module-test" -t $PROJECTNAME-dcycle-drupal8module-test .
docker run -d -p $PORT:80 $PROJECTNAME-dcycle-drupal8module-test

echo -e "[<<  ] End of script $0"
