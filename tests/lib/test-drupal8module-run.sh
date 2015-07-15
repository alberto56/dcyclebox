# propagate errors in the script
set -e
echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=7439

TESTID=$(./tests/lib/util/test-id.sh)

cp -r ./copy-to-your-project-root/drupal8module ./tests/tmp/.
cp -r ./tests/lib/files/drupal8module/*.* ./tests/tmp/drupal8module/.
cd ./tests/tmp/drupal8module

./dcycle/deploy.sh | grep 'prints this help'
echo '[pass] Calling ./dcycle/deploy.sh with no arguments prints help'

echo "[info] About to run the deploy script on port $PORT for test id $TESTID"
./dcycle/deploy.sh -p$PORT -n$TESTID -einternaltest

echo "[pass] Module mymodule is available in the Drupal database"

echo -e "[<<  ] End of script $0"
