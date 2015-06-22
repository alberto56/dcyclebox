set -e

echo -e "[  >>] Start of script $0"

./tests/lib/test-drupal7site-run.sh
./tests/lib/test-drupal7site-teardown.sh

echo -e "[<<  ] End of script $0"
