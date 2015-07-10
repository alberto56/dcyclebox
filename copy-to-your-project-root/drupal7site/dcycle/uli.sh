echo -e "[info] Running exec will cause failures on certain CI servers including CircleCI"
docker exec $(./dcycle/bin/container.sh) /bin/bash -c 'cd /var/www/html && drush uli'
