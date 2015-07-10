set -e
echo -e "[  >>] Start of script $0 (from $(pwd))"
START=$(date +%s)

./tests/lib/preflight.sh
PREFLIGHT=$?
if [ $PREFLIGHT -ne 0 ]
  then
    echo -e "[error] preflight failed with code $PREFLIGHT; please make sure you are"
    echo -e "        running the latest version of Docker on CoreOS."
    exit 1
fi

./tests/lib/run-setup.sh
echo -e "[info] After ./tests/lib/run-setup.sh exit code is $RESULT"
./tests/lib/run-main.sh
echo -e "[info] After ./tests/lib/run-main.sh exit code is $RESULT"
TESTID=$(./tests/lib/util/test-id.sh)
CONTAINERS=$(./tests/lib/util/container.sh $TESTID)
./tests/run-teardown.sh

echo -e "[info] After ./tests/lib/run.sh exit code is $RESULT"
SECONDS=`expr $(date +%s) - $START`
NUMCONTAINERS=$(echo $CONTAINERS | grep -o '[^ ]*' | wc -l)
echo -e "[info] $NUMCONTAINERS containers created and destroyed for testing in $SECONDS seconds"
echo -e "[<<  ] End of script $0"
