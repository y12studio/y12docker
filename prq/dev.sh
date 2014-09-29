#!/bin/bash
# ------------------------------------------------------------------
# build script
# ------------------------------------------------------------------

set -e

SUBJECT=y12docker-prq-dev
VERSION=0.1.0
USAGE="Usage: dev.sh -vh args"
DOCKER='sudo docker'
IMG=y12docker/prq

# --- Option processing --------------------------------------------
if [ $# == 0 ] ; then
    echo "$USAGE"
    exit 1;
fi

function cleandocker {
  $DOCKER rm $($DOCKER ps -a -q)
  $DOCKER rmi $($DOCKER images | grep "^<none>" | awk "{print $3}")
}

function build {
  $DOCKER build -t $IMG .
}

function run {
  $DOCKER run -p 8980:8080 -d $IMG
  $DOCKER ps
}

function stop {
  $DOCKER ps
  FOO=$($DOCKER ps | grep $IMG )
  # echo FOO=$FOO
  if [ ! -z "$FOO" ]; then
    echo "$FOO" | awk '{print $1}' | xargs $DOCKER stop
    echo [AFTER] stop the container
    $DOCKER ps
  fi
}

while getopts ":vhxbrst" optname; do
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
    "b")
      build
      exit 0;
      ;;
    "r")
      run
      exit 0;
      ;;
    "t")
      stop
      build
      run
      exit 0;
      ;;
    "s")
      stop
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
