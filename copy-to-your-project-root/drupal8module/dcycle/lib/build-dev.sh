# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=$1
PROJECTNAME=$2

docker build -f="Dcycle-Dockerfile-drupal8module" -t $PROJECTNAME-dcycle-drupal8module .
docker run -d -p $PORT:80 -v $(pwd):/srv/drupal/www/modules/mymodule/ $PROJECTNAME-dcycle-drupal8module

echo -e "[<<  ] End of script $0"
