echo -e "[  >>] Start of script $0 (from $(pwd))"
# Make sure errors propagate throughout the script
set -e

if [ "$(dirname $0)" != "./dcycle/lib" ];then
  echo -e "[error] The folder dcycle and its contents must be at the root of your"
  echo -e "        project, and must be called from the root of your project. That"
  echo -e "        is, for example, you must call ./dcycle/deploy.sh so that the location"
  echo -e "        (parent directory) of preflight.sh is ./dcycle/lib; it is currently"
  echo -e "        $(dirname $0)."
  exit 1;
fi

if [ ! -f ./Dcycle-Dockerfile-drupal8site ];then
  echo -e "[error] Dcycle-Dockerfile-drupal8site must exist. Please make sure that you correctly"
  echo -e "        installed "
  echo -e "        the dcycle scripts on your project, by copying the dcycle folder, and"
  echo -e "        Dockerfile, etc. to your project root."
  exit 1;
fi

if [ ! -f ./drupal/index.php ];then
  echo -e "[error] Please make sure your git repo contains a folder called Drupal, as"
  echo -e "        described in _An approach to code-driven development in Drupal 8_"
  echo -e "        at http://dcycleproject.org/blog/68."
  exit 1;
fi

if [ ! -f ./Dcycle-settings.sh ];then
  echo -e "[error] Please make you have a file in your git root called Dcycle-settings.sh"
  echo -e "        which should contain:"
  echo -e ""
  echo -e "        DCYCLE_SITE_DEPLOYMENT_MODULE=mysite_deploy"
  echo -e ""
  echo -e "        where mysite_deploy is the name of your site deployment module as"
  echo -e "        described in _An approach to code-driven development in Drupal 8_"
  echo -e "        at http://dcycleproject.org/blog/68."
  exit 1;
fi

echo -e "[<<  ] End of script $0"
