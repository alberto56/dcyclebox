# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=$1
PROJECTNAME=$2

docker build -f="Dcycle-Dockerfile-drupal7module-internaltest" -t $PROJECTNAME-dcycle-drupal7module-internaltest .
docker run -d -p $PORT:80 $PROJECTNAME-dcycle-drupal7module-internaltest

echo -e "[<<  ] End of script $0"
