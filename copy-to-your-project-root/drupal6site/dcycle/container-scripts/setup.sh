set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

echo -e "[info] About to check if the database already exists."

if [ ! -f /var/lib/mysql/drupal/users.frm ]
  then
    echo -e "[info] Database does not exist; we are assuming that this is an initial"
    echo -e "       deployment."
    echo -e "[info] Initial deployment: we will move the initial database from"
    echo -e "       /tmp/initial-database to /var/lib/mysql/drupal"
    mkdir -p /var/lib/mysql/drupal/
    mv /tmp/initial-database/* /var/lib/mysql/drupal/
    ./setup-initial.sh
  else
    echo -e "[info] Database exists, we will assume that we are to keep using it,"
    echo -e "       and update it if required."
    echo -e "[info] Start by removing the initial datababe."
    rm -rf /tmp/initial-database
    echo -e "[info] Update Drupal."
    service mysqld start && cd /var/www/html && drush updb -y
fi

chmod -R 777 /var/lib/mysql/drupal/
echo -e "[info] Make imagecache files owned by apache."
mkdir -p /var/www/html/sites/default/files/imagecache
echo -e "[info] Create .htaccess file in imagecache folder."
touch /var/www/html/sites/default/files/imagecache/.htaccess
chown -R apache:apache /var/www/html/sites/default/files/imagecache

echo -e "[<<  ] End of script $0"
