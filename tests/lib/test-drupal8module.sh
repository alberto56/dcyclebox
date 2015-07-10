set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

./tests/lib/test-drupal8module-run.sh
./tests/lib/test-drupal8module-teardown.sh

echo -e "[<<  ] End of script $0"
