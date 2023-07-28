#!/usr/bin/env bash

git submodule update --init
cd qwerty-learner
yarn install
yarn run build
cd ../
cp -r qwerty-learner/build webdist
go build

echo -e "\ngo-qwerty-learner build success"
