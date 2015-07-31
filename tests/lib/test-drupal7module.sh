set -e

echo -e "[  >>] Start of script $0"

./tests/lib/test-drupal7module-run.sh
./tests/lib/test-drupal7module-teardown.sh

echo -e "[<<  ] End of script $0"
