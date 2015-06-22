# propagate errors in the script
set -e

echo -e "[  >>] Start of script $0"

./tests/lib/delete-tmp-files.sh

echo -e "[<<  ] End of script $0"
