#!/bin/bash
# ------------------------------------------------------------------
# build script
# install [jpetazzo/nsenter](https://github.com/jpetazzo/nsenter)
# ------------------------------------------------------------------

set -e

SUBJECT=y12docker-prq-dev
VERSION=0.1.0
USAGE="Usage: gc2mt.sh -vh args"
DOCKER='sudo docker'
DENTER='sudo docker-enter'
IMG=y12docker/prq:devtest
SEC_WAIT_BOOT=3

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
  echo build a test image.
  $DOCKER build -t $IMG .
}

function nosetests {
  CID=$1
  echo "[SystemTest] Container " $CID
  echo "[SystemTest] boot and wait ...."
  secs=$SEC_WAIT_BOOT
  while [ $secs -gt 0 ]; do
     echo -ne "$secs\033[0K\r"
     sleep 1
     : $((secs--))
  done
  $DENTER $CID bash /app/gc2mt.sh -c  
}

function nosetests_in_container {
  cd /app && /usr/local/bin/nosetests -v
}

function run {
  local CID=$($DOCKER run -p 8980:8080 -d $IMG)
  echo "$CID"
}

function stop {
  $DOCKER ps
  # set -e exit here
  set +e
  FOO=$($DOCKER ps | grep $IMG)
  if [ ! -z "$FOO" ]; then
    echo stop a test image.
    echo FOO=$FOO
    echo "$FOO" | awk '{print $1}' | xargs $DOCKER stop
    echo [AFTER] stop the container
    $DOCKER ps
  else
    echo any image named $IMG not fund.
  fi
  set -e
}

while getopts ":vhxbrstc" optname; do
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
      CID=$(run)
      $DOCKER ps
      nosetests $CID
      exit 0;
      ;;
    "s")
      stop
      exit 0;
      ;;
    "c")
      nosetests_in_container
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
