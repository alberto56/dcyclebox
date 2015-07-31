set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

./tests/lib/test-drupal6site-run.sh
./tests/lib/test-drupal6site-teardown.sh

echo -e "[<<  ] End of script $0"
