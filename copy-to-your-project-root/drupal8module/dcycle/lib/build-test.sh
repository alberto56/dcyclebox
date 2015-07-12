# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

if [ ! -f ./Dcycle-Dockerfile-drupal8module-test ];then
  echo -e "[error] Dcycle-Dockerfile-drupal8module-test must exist. Because the contents"
  echo -e "        of this file differs from project to project, you must explicitly copy"
  echo -e "        it to from ./examples/ to your project root, and modify it."
  exit 1;
fi


PORT=$1
PROJECTNAME=$2

docker build -f="Dcycle-Dockerfile-drupal8module-test" -t $PROJECTNAME-dcycle-drupal8module-test .
docker run -d -p $PORT:80 $PROJECTNAME-dcycle-drupal8module-test

echo -e "[<<  ] End of script $0"
