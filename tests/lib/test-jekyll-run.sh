# propagate errors in the script
set -e
echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=9627
TESTID=$(./tests/lib/util/test-id.sh)

cp -r ./copy-to-your-project-root/jekyll ./tests/tmp/.
cd ./tests/tmp/jekyll

./dcycle/deploy.sh | grep 'prints this help'
echo '[pass] Calling ./dcycle/deploy.sh with no arguments prints help'

echo "[info] About to run the deploy script on port $PORT for test id $TESTID"
./dcycle/deploy.sh -p$PORT -n $TESTID

echo -e "[<<  ] End of script $0"
