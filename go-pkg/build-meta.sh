set -a

: ${GO_VERSION:=go1.4.2}
: ${INSTALL_PREFIX:=/usr/local}
: ${GOPATH:=/work}

export PATH=$INSTALL_PREFIX/$GO_VERSION/bin:$PATH
type -p go && go version
set +a
