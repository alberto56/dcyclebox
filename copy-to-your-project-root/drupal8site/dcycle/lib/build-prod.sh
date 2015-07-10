# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

echo -e "[warning] The use of the production script is meant for demonstration"
echo -e "          purposes and it is _not_ secure."

PORT=$1
PROJECTNAME=$2

docker build -f="Dcycle-Dockerfile-drupal8site-prod" -t $PROJECTNAME-dcycle-drupal8site-prod .
docker run -d -p $PORT:80 \
-v /data/$PROJECTNAME-dcycle-drupal8site-prod/files:/srv/drupal/www/sites/default/files \
-v /data/$PROJECTNAME-dcycle-drupal8site-prod/db:/db \
$PROJECTNAME-dcycle-drupal8site-prod

echo -e "[info] Running exec will cause failures on certain CI servers including CircleCI"
docker exec $(./dcycle/lib/container.sh $PROJECTNAME-dcycle-drupal8site-prod) /bin/bash -c 'cd ./srv/drupal/scripts && ./setup.sh'

echo -e "[<<  ] End of script $0"
