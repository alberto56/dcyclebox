echo -e "[  >>] Start of script $0 (from $(pwd))"
docker build -f "Dcycle-Dockerfile-drupal7module-internaltest" .
echo -e "[<<  ] End of script $0"
