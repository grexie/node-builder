#!/bin/bash -x

ROOTDIR=$(pwd)
NODE_VERSION=$(cat ${ROOTDOR}/NODE_VERSION)

git config --global user.name "Node Builder"
git config --global user.email "node@localhost"
git config --global core.autocrlf false
git config --global core.filemode false
git config --global color.ui true

mkdir -p ~/node

cd ~/node
git clone --depth 1 --branch v${NODE_VERSION} https://github.com/nodejs/node
cd ~/node/node

./configure --fully-static --enable-static

make -j8

cd out/
zip -j -r  ~/node/node.zip .

