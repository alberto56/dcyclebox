echo -e "[  >>] Start of script $0 (from $(pwd))"
echo -e "\n* * * * * * * * * * * * * * * * * * * * * * * * "
echo -e "DCYCLE deploy.sh"
echo -e "See http://box.dcycle.com for instructions and"
echo -e "mode details."
echo -e "Type ./dcycle/deploy.sh without any arguments for help."
echo -e "* * * * * * * * * * * * * * * * * * * * * * * * \n"

# Make sure errors propagate throughout the script
set -e

$(dirname $0)/lib/preflight.sh

if [ "$#" -eq "0" ]
  then
    cat './dcycle/readme/deploy.txt'
else
  while getopts ":p:n:" opt; do
    case $opt in
      p) PORT="$OPTARG";
      ;;
      n) NAME="$OPTARG";
      ;;
      \?) echo "Invalid option -$OPTARG" >&2
      ;;
    esac
  done

  if [ "$ENV" != "internal" ] && [ "$ENV" != "dev" ] && [ "$ENV" != "dev" ]
    then
      echo -e "[info] You did not specify the -e flag as test or dev, or specified it"
      echo -e "       as an invalid value, we are assuming dev."
      ENV='dev'
  fi
  if [ -z "$NAME" ]; then
    echo -e "[notice] The argument -n was not set, so we are assuming 'normal'"
    NAME=normal;
  fi

  DIRNAME=$(basename $(pwd))

  PROJECTNAME=$DIRNAME-$ENV-$NAME

  echo -e "[info] The project name has been determined based on the directory name of"
  echo -e "       your project and environment type:"
  echo -e "       $PROJECTNAME"

  echo -e "[info] Starting build"
  ./dcycle/lib/build-$ENV.sh $PORT $PROJECTNAME
fi

echo -e "\n* * * * * * * * * * * * * * * * * * * * * * * * "
echo -e "DCYCLE deploy.sh"
echo -e "end of script."
echo -e "* * * * * * * * * * * * * * * * * * * * * * * * \n"
echo -e "[<<  ] End of script $0"
