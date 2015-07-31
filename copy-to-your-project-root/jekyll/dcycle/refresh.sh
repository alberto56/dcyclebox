#!/bin/bash
if [ "$#" -ne  "1" ]
  then
    echo "Please supply exactly one argument, the hash of the container."
    echo "The container's hash be found in the list below. If you can't find"
    echo "it, please create a dev container by running ./dcycle/deploy.sh"
    echo ""
    echo "Usage:"
    echo ""
    echo "For container xyz123, refresh the Jekyll site by typing"
    echo ""
    echo "./dcycle/refresh.sh xyz123"
    docker ps
else
  echo -e "[info] Running exec will cause failures on certain CI servers including CircleCI"
  docker exec $1 /bin/bash -c 'cd /srv/jekyll && jekyll build .'
fi
