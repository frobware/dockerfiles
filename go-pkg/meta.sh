set -a

: ${PKG_ITERATION:=4}
: ${GO_VERSION:=go1.4.2}
: ${INSTALL_PREFIX:=/usr/local}
: ${GOROOT_FINAL:=${INSTALL_PREFIX}/${GO_VERSION}}
: ${GOPATH:=/work}

PATH=$GOROOT_FINAL/bin:$PATH

set +a
