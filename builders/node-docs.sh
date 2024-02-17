#!/bin/bash -x

set -e

ROOTDIR=$(pwd)

. ${ROOTDIR}/builders/arch/${ARCH}.sh
. ${ROOTDIR}/builders/platform/${PLATFORM}.sh

git config --global user.name "Node Builder"
git config --global user.email "node@localhost"
git config --global core.autocrlf false
git config --global core.filemode false
git config --global color.ui true

mkdir -p ~/node

cd ~/node
git clone --depth 1 --branch v${VERSION} https://github.com/nodejs/node
cd ~/node/node

./configure --shared --dest-cpu ${ARCH} --dest-os ${PLATFORM} --cross-compiling --without-npm ${NODE_CONFIGURE_FLAGS}

make doc
