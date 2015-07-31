# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0"

PORT=$1
PROJECTNAME=$2

docker build -f="Dockerfile-dcycle-drupal7module" -t $PROJECTNAME-dcycle-drupal7module .
docker run -d -p $PORT:80 -v $(pwd):/srv/drupal/www/sites/all/modules/mymodule/ $PROJECTNAME-dcycle-drupal7module

echo -e "[<<  ] End of script $0"
