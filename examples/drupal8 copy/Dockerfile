# Our Dockerfile needs to be named "Dockerfile" because we are using CircleCI
# and it does not allow us to use the -f flag to specify another filename (for
# example Dockerfile-test). (See also ./scripts/test.sh).
# For the base Dockerfile, see https://github.com/alberto56/docker-drupal
FROM alberto56/docker-drupal:8.0.x-dev-1.2-8.0.0-beta10

ADD . ./srv/drupal/www/modules/realistic_dummy_content/

# The following issues are preventing us from running PHPUnit tests in the same run-tests.sh command as above:
#  * https://www.drupal.org/node/2189345#comment-9923124
#  * https://www.drupal.org/node/2488870

# Unit tests

RUN cd /srv/drupal/www && core/vendor/phpunit/phpunit/phpunit --bootstrap ./core/tests/bootstrap.php modules/realistic_dummy_content/api/tests/src/Unit

# Tests requiring database and a webserver

RUN cd /srv/drupal/www && php ./core/scripts/run-tests.sh --php /usr/bin/php --url http://127.0.0.1/ realistic_dummy_content
