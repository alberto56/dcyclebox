# propagate errors in the script
set -e
echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=7589

TESTID=$(./tests/lib/util/test-id.sh)

cp -r ./copy-to-your-project-root/drupal7site ./tests/tmp/.
cp -r ./tests/lib/files/drupal7site/* ./tests/tmp/drupal7site/.
cd ./tests/tmp/drupal7site
echo -e '[info] ./tests/tmp/drupal7site should now contain bare-bones d7 site structure for testing'
ls -lah

./dcycle/deploy.sh | grep 'prints this help'
echo '[pass] Calling ./dcycle/deploy.sh with no arguments prints help'

echo "[info] About to run the deploy script on port $PORT for test id $TESTID"
./dcycle/deploy.sh -p$PORT -n $TESTID -etest
echo "[info] About to make sure our module is available in the container"

docker run drupal7site-dev-$TESTID-dcycle-drupal7site bash -c 'grep -i "DocumentRoot" /etc/httpd/conf/httpd.conf'
echo "[pass] httpdconf is valid"

echo -e "[<<  ] End of script $0"
