#!/bin/bash
if [ ! -d "/${PDIR}" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  echo "[CMD] docker run -v \$(pwd)/${PDIR}:/${PDIR}"
  exit 1
fi
# Copy files to /fastwp directory
cp -r /dc/* /${PDIR}

echo ""
echo "   cd ${PDIR} && . ./post.sh"
echo ""
