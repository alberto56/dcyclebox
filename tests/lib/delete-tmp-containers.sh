# propagate errors in the script
set -e

echo -e "[  >>] Start of script $0"

TESTID=$(./tests/lib/util/test-id.sh)
CONTAINERS=$(./tests/lib/util/container.sh $TESTID)

echo "[info] found containers to delete: $CONTAINERS"

docker kill $CONTAINERS

echo -e "[<<  ] End of script $0"
