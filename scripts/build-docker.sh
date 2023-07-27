#!/usr/bin/env bash

# usage
# build the latest image
# ./scripts/build-docker.sh
# build the image with a specified tag
# ./scripts/build-docker.sh v0.1.0

# update git repository
# git pull --no-rebase

# update the latest images
docker pull node:latest
docker pull golang:latest

# set GOPROXY environment variable
# GOPROXY=https://goproxy.cn

# set the go-qwerty-learner docker image name by GO_QWERTY_LEARNER_IMAGE_NAME variable
GO_QWERTY_LEARNER_IMAGE_NAME=nosrc/go-qwerty-learner

# set the go-qwerty-learner docker image tag by GO_QWERTY_LEARNER_IMAGE_TAG variable
GO_QWERTY_LEARNER_IMAGE_TAG=latest

# reset GO_QWERTY_LEARNER_IMAGE_TAG to the value of the first parameter provided by the user
if [ -n "$1" ]; then
  GO_QWERTY_LEARNER_IMAGE_TAG=$1
fi

# remove the existing old image
docker rmi -f $GO_QWERTY_LEARNER_IMAGE_NAME:$GO_QWERTY_LEARNER_IMAGE_TAG

# build Dockerfile
docker build --build-arg GOPROXY=$GOPROXY -t $GO_QWERTY_LEARNER_IMAGE_NAME:$GO_QWERTY_LEARNER_IMAGE_TAG .

# remove dangling images
docker image prune -f

# run a container to print the go-qwerty-learner version
docker run -it --rm --name running-go-qwerty-learner-version $GO_QWERTY_LEARNER_IMAGE_NAME:$GO_QWERTY_LEARNER_IMAGE_TAG go-qwerty-learner -v

# push the image to the DockerHub
# docker push $GO_QWERTY_LEARNER_IMAGE_NAME:$GO_QWERTY_LEARNER_IMAGE_TAG
