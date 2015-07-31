#!/bin/bash
if [ "$#" -ne  "2" ]
  then
    echo "Please supply exactly two arguments, the hash of the container"
    echo "(the container's hash be found in the list below. If you can't find"
    echo "it, please create a dev container by running ./deploy/dcycle.sh),"
    echo "and the location of the .sql file."
    echo ""
    echo "Usage:"
    echo ""
    echo "For container xyz123, import mydatabase.sql"
    echo ""
    echo "./dcycle/import.sh xyz123 mydatabase.sql"
    docker ps
else
  echo -e "[info] Running exec will cause failures on certain CI servers including CircleCI"
  docker exec -i $1 /bin/bash -c "cd /var/www/html && drush sqlc" < $(pwd)/$2
fi
