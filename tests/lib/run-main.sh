# propagate errors in the script
set -e
echo -e "[  >>] Start of script $0"

./tests/lib/test-jekyll.sh
./tests/lib/test-drupal7module.sh
./tests/lib/test-drupal8module.sh

echo -e "[<<  ] End of script $0"
