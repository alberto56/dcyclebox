# propagate errors in the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

./tests/lib/delete-tmp-files.sh
./tests/lib/delete-tmp-containers.sh

echo -e "[<<  ] End of script $0"
