# propagate errors in the script
set -e

PORT=9627
TESTID=$(./tests/lib/util/test-id.sh)

echo '[info] Start of script ./tests/lib/test-jekyll-run.sh'

cp -r ./move-to-your-project-root/jekyll ./tests/tmp/.
cd ./tests/tmp/jekyll

./dcycle/deploy.sh | grep 'prints this help'
echo '[pass] Calling ./dcycle/deploy.sh with no arguments prints help'

echo "[info] About to run the deploy script on port $PORT for test id $TESTID"
./dcycle/deploy.sh -p$PORT -n $TESTID

echo '[info] End of script ./tests/lib/test-jekyll-run.sh'
