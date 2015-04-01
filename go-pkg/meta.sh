set -a

: ${PKG_ITERATION:=7}
: ${GO_VERSION:=go1.4.2}
: ${INSTALL_PREFIX:=/usr/local}
: ${GOPATH:=/work}

PATH=$INSTALL_PREFIX/$GO_VERSION/bin:$PATH

set +a
