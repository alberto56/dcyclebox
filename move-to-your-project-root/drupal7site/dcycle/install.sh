# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0"

# Find the currently running container, install a new drupal site based on the contents
# of the current repo, then enable the site deployment module to get a functional site.
docker exec $(./dcycle/lib/container.sh) /bin/bash -c 'cd /var/www/html && php -d sendmail_path=`which true` /.composer/vendor/drush/drush/drush.php si -y --db-url=mysql://root:@localhost/drupal && cd /var/www/html'

echo -e "[<<  ] End of script $0"
