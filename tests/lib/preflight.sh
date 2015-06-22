echo -e "[  >>] Start of script $0"
# propagate errors in the script
set -e

echo '[info] Start of script ./tests/lib/preflight.sh'

which docker
docker version

echo '[info] End of script ./tests/lib/preflight.sh'
echo -e "[<<  ] End of script $0"
