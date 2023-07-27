# go-qwerty-learner

[![Build](https://img.shields.io/github/actions/workflow/status/no-src/go-qwerty-learner/go.yml?branch=main)](https://github.com/no-src/go-qwerty-learner/actions)
[![License](https://img.shields.io/github/license/no-src/go-qwerty-learner)](https://github.com/no-src/go-qwerty-learner/blob/main/LICENSE)
[![Release](https://img.shields.io/github/v/release/no-src/go-qwerty-learner)](https://github.com/no-src/go-qwerty-learner/releases)

The `go-qwerty-learner` is a project that distributes [qwerty-learner](https://github.com/Kaiyiwing/qwerty-learner)
through a standalone binary file.

## Installation

The first need [Go](https://go.dev/doc/install), [Node](https://nodejs.org/en/download)
and [Git](https://git-scm.com/downloads) installed, then you can use the below command to install `go-qwerty-learner`.

### Windows

```bash
$ scripts\build.bat
```

### Linux or macOS

```bash
$ chmod +x ./scripts/build.sh && ./scripts/build.sh
```

### Docker

You can use the [build-docker.sh](/scripts/build-docker.sh) script to build the docker image and you should clone this
repository and `cd` to the root path of the repository first.

```bash
$ chmod +x ./scripts/build-docker.sh && ./scripts/build-docker.sh
```

Or pull the docker image directly from [DockerHub](https://hub.docker.com/r/nosrc/go-qwerty-learner) with the command
below.

```bash
$ docker pull nosrc/go-qwerty-learner
```

For more scripts about release and docker, please see the [scripts](/scripts) directory.

## Quick Start

### Windows

```bash
$ go-qwerty-learner.exe
```

### Linux or macOS

```bash
$ ./go-qwerty-learner
```

### Docker

```bash
$ docker run -it --rm --name running-go-qwerty-learner -p 9097:9097 nosrc/go-qwerty-learner:latest go-qwerty-learner
```