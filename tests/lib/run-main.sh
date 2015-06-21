# propagate errors in the script
set -e

echo '[info] Start of script ./tests/run.sh'

./tests/lib/test-jekyll.sh

echo '[info] End of script ./tests/run.sh'
