# propagate errors in the script
echo '[info] Start of script ./tests/lib/run-teardown.sh'

./tests/lib/delete-tmp-files.sh
./tests/lib/delete-tmp-containers.sh

echo '[info] End of script ./tests/lib/run-teardown.sh'
