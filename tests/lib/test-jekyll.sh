set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

./tests/lib/test-jekyll-run.sh
./tests/lib/test-jekyll-teardown.sh

echo -e "[<<  ] End of script $0"
