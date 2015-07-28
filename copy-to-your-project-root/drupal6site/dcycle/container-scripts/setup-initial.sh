set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

echo -e "[info] Initial deployment: we will enable the site deployment module"
source ./Dcycle-settings.sh
cd /srv/drupal/www && drush en ${DCYCLE_SITE_DEPLOYMENT_MODULE} -y

echo -e "[<<  ] End of script $0"
