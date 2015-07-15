# propagate errors in the script
set -e
echo -e "[  >>] Start of script $0 (from $(pwd))"

cd ./images/dcyclebox-centos-lamp
docker build .
cd ../../

echo -e "[<<  ] End of script $0"
