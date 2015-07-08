# propagate errors in the script
set -e
echo -e "[  >>] Start of script $0"

PORT=7439

TESTID=$(./tests/lib/util/test-id.sh)

cp -r ./move-to-your-project-root/drupal8module ./tests/tmp/.
cp -r ./tests/lib/files/drupal8module/*.* ./tests/tmp/drupal8module/.
cd ./tests/tmp/drupal8module

./dcycle/deploy.sh | grep 'prints this help'
echo '[pass] Calling ./dcycle/deploy.sh with no arguments prints help'

echo "[info] About to run the deploy script on port $PORT for test id $TESTID"
./dcycle/deploy.sh -p$PORT -n $TESTID
echo "[info] About to make sure our module is available in the container for D8"
./dcycle/drush.sh $(./dcycle/lib/container.sh drupal8module-dev-$TESTID-dcycle-drupal8module) pml|grep 'mymodule'
echo "[pass] Module mymodule is available in the Drupal database"

echo -e "[<<  ] End of script $0"