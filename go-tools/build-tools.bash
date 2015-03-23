#!/bin/bash

set -o errtrace
set -o errexit
set -o nounset

export GOPATH=/go-tools

trap "exit 1;" SIGINT

: ${GET:=get}

go ${GET} golang.org/x/tools/cmd/...
go ${GET} code.google.com/p/rog-go/exp/cmd/godef
go ${GET} github.com/dougm/goflymake
go ${GET} github.com/jstemmer/gotags
go ${GET} github.com/kisielk/errcheck
go ${GET} github.com/nsf/gocode
go ${GET} github.com/inconshreveable/gonative
go ${GET} github.com/golang/lint/golint
go ${GET} github.com/opennota/check/cmd/...
