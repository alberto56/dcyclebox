echo -e "[  >>] Start of script $0"
docker build -f "Dockerfile-test" .
echo -e "[<<  ] End of script $0"
