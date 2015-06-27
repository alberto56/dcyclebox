set -e

echo -e "[  >>] Start of script $0"

echo -e "[info] About to check if the database already exists."

if [ ! -f /db/.ht.sqlite ]
  then
    echo -e "[info] Database does not exist; we are assuming that this is an initial"
    echo -e "       deployment."
    echo -e "[info] Initial deployment: we will move the initial database from"
    echo -e "       /tmp/initial-database to /db/.ht.sqlite"
    mv /tmp/initial-database /db/.ht.sqlite
    ./setup-initial.sh
  else
    echo -e "[info] Database exists, we will assume that we are to reuse it.."
    echo -e "[info] Start by removing the initial datababe."
    rm /tmp/initial-database
    echo -e "[info] Update Drupal."
    cd /srv/drupal/www && drush updb -y && drush config-import deploy -y
fi

chown www-data:www-data /db
chown www-data:www-data /srv/drupal/www/sites/default/files
chmod 777 /srv/drupal/www/sites/default/files

echo -e "[<<  ] End of script $0"
