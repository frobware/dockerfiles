#!/bin/bash

set -o errtrace
set -o errexit
set -o nounset

trap "exit 1;" SIGINT

export GOROOT_BOOTSTRAP=$(go env GOROOT)

if [ ! -d go ]; then
    git clone --depth=1 https://github.com/golang/go.git
fi

cd go/src
git reset --hard
git clean -f -d -x

if [ ${GIT_TREE_UPDATE:=no} = "yes" ]; then
    git pull --rebase
fi

git log -1 --pretty='format:%h %s'

GOOS=${X_GOOS} GOARCH=${X_GOARCH} ./bootstrap.bash
