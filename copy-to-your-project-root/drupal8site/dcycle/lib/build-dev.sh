# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=$1
PROJECTNAME=$2

docker build -f="Dcycle-Dockerfile-drupal8site" -t $PROJECTNAME-dcycle-drupal8site .
docker run -d -p $PORT:80 \
-v $(pwd)/drupal/modules:/srv/drupal/www/modules \
-v $(pwd)/drupal/themes:/srv/drupal/www/themes \
-v $(pwd)/deploy:/srv/drupal/deploy \
$PROJECTNAME-dcycle-drupal8site

echo -e "[info] Running exec will cause failures on certain CI servers including CircleCI"
docker exec $(./dcycle/lib/container.sh $PROJECTNAME-dcycle-drupal8site) /bin/bash -c 'cd ./srv/drupal/scripts && ./setup-initial.sh'

echo -e "[<<  ] End of script $0"
