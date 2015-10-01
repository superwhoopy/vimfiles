#!/bin/bash

cd bundle/
for DIR in $(ls);
do
  echo "Processing ${DIR}"
  cd ${DIR}
  REMOTE=$(git config --get remote.origin.url)
  cd ..
  rm -rf ${DIR}
  git submodule add ${REMOTE}
done
cd ..
