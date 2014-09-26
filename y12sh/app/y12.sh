#!/bin/bash
# ------------------------------------------------------------------
# ELK log utility image build script
# ------------------------------------------------------------------

set -e

SUBJECT=y12sh-id
VERSION=0.1.0
USAGE="Usage: y12.sh -vh args"
DOCKER='sudo docker'

# --- Option processing --------------------------------------------
if [ $# == 0 ] ; then
    echo "$USAGE"
    exit 1;
fi

function cleandocker {
  $DOCKER rm $($DOCKER ps -a -q)
  $DOCKER rmi $($DOCKER images | grep "^<none>" | awk "{print $3}")
}

while getopts ":vhxc:" optname; do
  case "$optname" in
    "v")
      echo "Version $VERSION"
      exit 0;
      ;;
    "x")
      echo "clean all stopped containers and all untagged images"
      cleandocker
      exit 0;
      ;;
    "c")
      #  y12.sh -c "AppName /host/tmp/path"
      ADDR=($OPTARG)
      APP=${ADDR[0]}
      HPATH=${ADDR[1]}
      echo cp "$APP" from y12docker/y12 to host "$HPATH"
      if [ -d $HPATH/$APP ]; then 
         rm -rf $HPATH/$APP
      fi
      $DOCKER run -v $HPATH:$HPATH y12docker/y12sh cp -R /opt/app/$APP $HPATH
      ls -al $HPATH
      exit 0;
      ;;
    "h")
      echo "$USAGE"
      exit 0;
      ;;
    "?")
      echo "Unknown option $OPTARG"
      exit 0;
      ;;
    ":")
      echo "No argument value for option $OPTARG"
      exit 0;
      ;;
    *)
      echo "Unknown error while processing options"
      exit 0;
      ;;
  esac
done

shift "$($OPTIND - 1)"

# -----------------------------------------------------------------

LOCK_FILE=/tmp/${SUBJECT}.lock

if [ -f "$LOCK_FILE" ]; then
echo "Script is already running"
exit
fi

# -----------------------------------------------------------------
trap 'rm -f $LOCK_FILE' EXIT
touch $LOCK_FILE
