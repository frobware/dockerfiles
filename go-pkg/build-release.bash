#!/bin/bash

set -o errtrace
set -o errexit
set -o nounset

trap "exit 1;" SIGINT

TOP_DIR=$(cd $(dirname "$0") && pwd)
source $TOP_DIR/build-meta.sh

if [ ! -d go ]; then
    git clone --depth=1 https://github.com/golang/go.git -b ${GO_VERSION}
fi

ls

pwd
cd go/src
git reset --hard
git checkout ${GO_VERSION}
git clean -f -d -x

export GOROOT_FINAL

./make.bash

export GOROOT=$TOP_DIR/go
PATH=$GOROOT/bin:$PATH

go env

# git clone http://github.com/davecheney/golang-crosscompile
if [ -d $TOP_DIR/golang-crosscompile ]; then
    source $TOP_DIR/golang-crosscompile/crosscompile.bash
    go-crosscompile-build-all
fi

export GOPATH=$(mktemp -d)
go install -v golang.org/x/tools/cmd/godoc/...
rm -rf $GOPATH
