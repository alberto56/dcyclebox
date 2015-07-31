# propagate errors in the script
set -e
echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=7233

TESTID=$(./tests/lib/util/test-id.sh)

cp -r ./copy-to-your-project-root/drupal6site ./tests/tmp/.
cd ./tests/tmp/drupal6site
echo -e '[info] ./tests/tmp/drupal6site should now contain bare-bones d6 site structure for testing'

./dcycle/deploy.sh | grep 'Please make you have a file'
echo '[pass] Calling ./dcycle/deploy.sh checks if there is a settings file'

echo 'DCYCLE_SITE_DEPLOYMENT_MODULE=mysite_deploy' > Dcycle-settings.sh

./dcycle/deploy.sh | grep 'prints this help'
echo '[pass] Calling ./dcycle/deploy.sh with no arguments prints help'

echo "[info] About to run the deploy script on port $PORT for test id $TESTID"
./dcycle/deploy.sh -p$PORT -n $TESTID -einternal
echo "[info] About to make sure our module is available in the container"

echo -e "[<<  ] End of script $0"
