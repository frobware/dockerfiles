FROM frobware/effing-package-manager
MAINTAINER Andrew McDermott <aim@frobware.com>
RUN apt-get update && apt-get -y install --no-install-recommends git gcc mercurial pkg-config libpcre3 libpcre3-dev rpm
RUN mkdir /work /target
WORKDIR /work
ADD *.bash *.sh /work/
ENV GO_VERSION=go1.4.2
RUN git clone --depth=1 https://github.com/golang/go.git -b ${GO_VERSION}
ENV GOROOT_FINAL=/usr/local/go1.4.2
RUN pwd
RUN (cd go/src && ./make.bash)
ENV GOROOT=/work/go
ENV PATH=/work/go/bin:$PATH
ENV GOPATH=/work/gopath
RUN go get -v golang.org/x/tools/cmd/godoc/...
ADD installer /installer
RUN /work/build-package.bash /target
CMD /installer
