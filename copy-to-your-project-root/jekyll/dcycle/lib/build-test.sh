# Make sure errors propagate throughout the script
set -e

echo -e "[  >>] Start of script $0 (from $(pwd))"

PORT=$1
PROJECTNAME=$2

docker build -f="Dcycle-Dockerfile-jekyll-internaltest" -t $PROJECTNAME-jekyll-internaltest .

echo -e "[<<  ] End of script $0"
