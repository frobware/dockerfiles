FROM debian:jessie
MAINTAINER Andrew McDermott <aim@frobware.com>
RUN mkdir /gopath
ENV GOPATH /gopath
RUN apt-get update && apt-get install -y git mercurial bzr
ADD *.deb /gopath/
RUN /bin/bash -c 'UPDATE_ALTERNATIVES=1 dpkg -i /gopath/*.deb'
RUN go env

RUN go get -u golang.org/x/tools/cmd/...

RUN go get -u github.com/dougm/goflymake
RUN go get -u github.com/jstemmer/gotags
#RUN go get -u github.com/inconshreveable/gonative
RUN go get -u github.com/opennota/check/cmd/...

RUN go get -u github.com/tools/godep/...

RUN go get github.com/golang/lint/golint
RUN go get github.com/kisielk/errcheck
RUN go get golang.org/x/tools/cmd/benchcmp
RUN go get github.com/cespare/prettybench
RUN go get github.com/ajstarks/svgo/benchviz
RUN go get golang.org/x/tools/cmd/stringer
RUN go get github.com/josharian/impl
RUN go get golang.org/x/tools/cmd/goimports
RUN go get sourcegraph.com/sqs/goreturns
RUN go get github.com/rogpeppe/godef
RUN go get github.com/nsf/gocode
RUN go get golang.org/x/tools/cmd/oracle
RUN go get golang.org/x/tools/cmd/gorename
RUN go get github.com/kisielk/godepgraph
RUN go get github.com/fzipp/pythia

# These are already in my go .deb but they are expected to be in
# GOROOT/bin so remove the duplication.
RUN rm -f /gopath/bin/oracle
RUN rm -f /gopath/bin/godoc
RUN rm -f /gopath/bin/gofmt

ADD installer /gopath/
CMD /gopath/installer
