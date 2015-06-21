set -e

echo '[info] Start of script ./tests/lib/test-jekyll.sh'

./tests/lib/test-jekyll-run.sh
./tests/lib/test-jekyll-teardown.sh

echo '[info] End of script ./tests/lib/test-jekyll.sh'
