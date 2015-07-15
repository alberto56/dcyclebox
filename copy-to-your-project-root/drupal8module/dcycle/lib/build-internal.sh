# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=$1
PROJECTNAME=$2

docker build -f="Dcycle-Dockerfile-drupal8module-internal" -t $PROJECTNAME-dcycle-d8m-internal .
docker run -d -p $PORT:80 $PROJECTNAME-dcycle-d8m-internal

echo -e "[<<  ] End of script $0"
