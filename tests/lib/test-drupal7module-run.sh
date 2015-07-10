# propagate errors in the script
set -e
echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=7489

TESTID=$(./tests/lib/util/test-id.sh)

echo '[info] Start of script ./tests/lib/test-drupal7module-run.sh'

cp -r ./copy-to-your-project-root/drupal7module ./tests/tmp/.
cp -r ./tests/lib/files/drupal7module/*.* ./tests/tmp/drupal7module/.
cd ./tests/tmp/drupal7module

./dcycle/deploy.sh | grep 'prints this help'
echo '[pass] Calling ./dcycle/deploy.sh with no arguments prints help'

echo "[info] About to run the deploy script on port $PORT for test id $TESTID"
./dcycle/deploy.sh -p$PORT -n $TESTID -etest
echo "[info] About to make sure our module is available in the container"

echo -e "[<<  ] End of script $0"
