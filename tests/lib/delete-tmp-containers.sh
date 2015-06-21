# propagate errors in the script
set -e

echo '[info] Start of script ./delete-tmp-containers.sh'

TESTID=$(./tests/lib/util/test-id.sh)
CONTAINERS=$(./tests/lib/util/container.sh $TESTID)

echo "[info] found containers to delete: $CONTAINERS"

docker kill $CONTAINERS

echo '[info] End of script ./delete-tmp-containers.sh'
