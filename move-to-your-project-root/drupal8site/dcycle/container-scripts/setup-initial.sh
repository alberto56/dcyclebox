set -e

echo -e "[  >>] Start of script $0"

echo -e "[info] Initial deployment: we will enable site deployment module and"
echo -e "       use Drupal 8 config management as described in _An approach to"
echo -e "       code-driven development in Drupal 8_"
source ./Dcycle-settings.sh
cd /srv/drupal/www && drush en ${DCYCLE_SITE_DEPLOYMENT_MODULE} -y &&\
drush config-import deploy -y

echo -e "[<<  ] End of script $0"
