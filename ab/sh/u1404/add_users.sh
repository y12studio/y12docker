#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "add_users.sh name_prefix"
    exit 1
fi
PREFIX=${1}
# echo "Host Username Password"
for i in {81..85}
do
   NUSER="${1}$i"
   NPASS=$(openssl rand -base64 12 | tr -d '+=/')
   sudo adduser --quiet --disabled-password -shell /bin/bash --home /home/${NUSER} --gecos "${NUSER}" ${NUSER}
   echo "${NUSER}:${NPASS}" | sudo chpasswd
   # to add the new user to docker group
   sudo usermod -aG docker ${NUSER}
   echo ${NUSER} ${NPASS}
done
