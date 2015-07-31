# propagate errors in the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

TESTID=$(./tests/lib/util/test-id.sh)
CONTAINERS=$(./tests/lib/util/container.sh $TESTID)

echo -e "[INFO] Looking for container(s) which contain the following string:"
echo -e "       $TESTID"

echo -e "[INFO] Found container(s) to delete:"
echo -e "       $CONTAINERS"

docker kill $CONTAINERS

echo -e "[<<  ] End of script $0"
