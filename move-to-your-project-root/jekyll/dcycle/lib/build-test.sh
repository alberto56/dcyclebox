# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0"

PORT=$1
PROJECTNAME=$2

docker build -f="Dockerfile-dcycle-jekyll-test" -t $PROJECTNAME-jekyll-test .

echo -e "[<<  ] End of script $0"
