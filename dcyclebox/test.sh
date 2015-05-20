# Start by building the box
docker build -t dcyclebox-test .

# Test CURL
docker run dcyclebox-test bash -c 'which curl' && echo '[test] curl works'
