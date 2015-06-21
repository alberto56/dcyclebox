# propagate errors in the script
set -e

echo '[info] Start of script ./delete-tmp-files.sh'

rm -rf ./tests/tmp
mkdir ./tests/tmp
echo 'Files used temporarily during tests. The contents of this folder can be deleted at any time.' >> ./tests/tmp/README.md

echo '[info] End of script ./delete-tmp-files.sh'
