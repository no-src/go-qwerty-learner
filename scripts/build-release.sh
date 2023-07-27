#!/usr/bin/env bash

# update repository
#git pull --no-rebase

# update the last git commit
echo -e "$(git rev-parse main)\c" >internal/version/commit

# set GOPROXY environment variable
# export GOPROXY=https://goproxy.cn

############################## build-web ##############################

git submodule update --init
cd qwerty-learner
yarn install
yarn run build
cd ../
cp -r qwerty-learner/build server/dist

############################## build-web ##############################

############################## linux-release ##############################

# set go env for linux
export GOOS=linux
export GOARCH=amd64

# build go-qwerty-learner
go build -v -o . ./...

export GO_QWERTY_LEARNER_RELEASE_GO_VERSION=$(go version | awk '{print $3}')
export GO_QWERTY_LEARNER_RELEASE_VERSION=$(./go-qwerty-learner -v | awk 'NR==1 {print $3}')

# release path, for example, go_qwerty_learner_go1.20.2_amd64_linux_v0.1.0
export GO_QWERTY_LEARNER_RELEASE="go_qwerty_learner_${GO_QWERTY_LEARNER_RELEASE_GO_VERSION}_${GOARCH}_${GOOS}_${GO_QWERTY_LEARNER_RELEASE_VERSION}"

rm -rf "$GO_QWERTY_LEARNER_RELEASE"
mkdir "$GO_QWERTY_LEARNER_RELEASE"
mv go-qwerty-learner "$GO_QWERTY_LEARNER_RELEASE/"

# linux release archive
tar -zcvf "$GO_QWERTY_LEARNER_RELEASE.tar.gz" "$GO_QWERTY_LEARNER_RELEASE"

rm -rf "$GO_QWERTY_LEARNER_RELEASE"

############################## linux-release ##############################

############################# windows-release #############################

# set go env for windows
export GOOS=windows
export GOARCH=amd64

# build go-qwerty-learner
go build -v -o . ./...

# release path, for example, go_qwerty_learner_go1.20.2_amd64_windows_v0.1.0
export GO_QWERTY_LEARNER_RELEASE="go_qwerty_learner_${GO_QWERTY_LEARNER_RELEASE_GO_VERSION}_${GOARCH}_${GOOS}_${GO_QWERTY_LEARNER_RELEASE_VERSION}"

mkdir "$GO_QWERTY_LEARNER_RELEASE"
mv go-qwerty-learner.exe "$GO_QWERTY_LEARNER_RELEASE/"

# windows release archive
zip -r "$GO_QWERTY_LEARNER_RELEASE.zip" "$GO_QWERTY_LEARNER_RELEASE"

rm -rf "$GO_QWERTY_LEARNER_RELEASE"

############################# windows-release #############################

############################## macOS-release ##############################

# set go env for macOS
export GOOS=darwin
export GOARCH=amd64

# build go-qwerty-learner
go build -v -o . ./...

# release path, for example, go_qwerty_learner_go1.20.2_amd64_darwin_v0.1.0
export GO_QWERTY_LEARNER_RELEASE="go_qwerty_learner_${GO_QWERTY_LEARNER_RELEASE_GO_VERSION}_${GOARCH}_${GOOS}_${GO_QWERTY_LEARNER_RELEASE_VERSION}"

rm -rf "$GO_QWERTY_LEARNER_RELEASE"
mkdir "$GO_QWERTY_LEARNER_RELEASE"
mv go-qwerty-learner "$GO_QWERTY_LEARNER_RELEASE/"

# macOS release archive
tar -zcvf "$GO_QWERTY_LEARNER_RELEASE.tar.gz" "$GO_QWERTY_LEARNER_RELEASE"

rm -rf "$GO_QWERTY_LEARNER_RELEASE"

############################## macOS-release ##############################

# reset commit file
echo -e "\c" >internal/version/commit
