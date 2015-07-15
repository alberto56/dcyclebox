set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

./tests/lib/test-dcycle-centos6-run.sh
./tests/lib/test-dcycle-centos6-teardown.sh

echo -e "[<<  ] End of script $0"
