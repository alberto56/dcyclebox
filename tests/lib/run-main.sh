# propagate errors in the script
set -e
echo -e "[  >>] Start of script $0 (from $(pwd))"

./tests/lib/test-jekyll.sh
./tests/lib/test-drupal7module.sh
./tests/lib/test-drupal8module.sh
./tests/lib/test-drupal7site.sh
./tests/lib/test-dcycle-centos6.sh

echo -e "[<<  ] End of script $0"
