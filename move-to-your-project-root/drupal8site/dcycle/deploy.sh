echo -e "[  >>] Start of script $0"
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
  while getopts ":p:n:e:" opt; do
    case $opt in
      p) PORT="$OPTARG";
      ;;
      n) NAME="$OPTARG";
      ;;
      e) ENV="$OPTARG";
      ;;
      \?) echo "Invalid option -$OPTARG" >&2
      ;;
    esac
  done

  # dev is the only available environment type for now, we eventually will want
  # prod as well.
  ENV='dev'
  PROJECTNAME=$(basename $(pwd))-$ENV-$NAME

  echo -e "[info] The project name has been determined based on the directory name of"
  echo -e "       your project and environment type:"
  echo -e "       $PROJECTNAME"

  echo -e "[info] Creating _site directory if it does not exist"
  mkdir -p _site
  echo -e "[info] Starting build"
  ./dcycle/lib/build-$ENV.sh $PORT $PROJECTNAME
fi

echo -e "\n* * * * * * * * * * * * * * * * * * * * * * * * "
echo -e "DCYCLE deploy.sh"
echo -e "end of script."
echo -e "* * * * * * * * * * * * * * * * * * * * * * * * \n"
echo -e "[<<  ] End of script $0"
