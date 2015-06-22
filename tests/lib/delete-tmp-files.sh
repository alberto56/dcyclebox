# propagate errors in the script
set -e

echo -e "[  >>] Start of script $0"

rm -rf ./tests/tmp
mkdir ./tests/tmp
echo 'Files used temporarily during tests. The contents of this folder can be deleted at any time.' >> ./tests/tmp/README.md

echo -e "[<<  ] End of script $0"
