echo '[info] Start of script ./tests/run.sh'

./tests/lib/run-setup.sh
RESULT=$?||0
echo -e "[info] After ./tests/lib/run-setup.sh exit code is $RESULT"
./tests/lib/run-main.sh
RESULT=$RESULT||$?||0
echo -e "[info] After ./tests/lib/run-main.sh exit code is $RESULT"
./tests/lib/run-teardown.sh

echo '[info] End of script ./tests/run.sh'
echo -e "[info] After ./tests/lib/run.sh exit code is $RESULT"
exit $RESULT
