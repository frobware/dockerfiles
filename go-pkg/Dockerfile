FROM frobware/effing-package-manager
MAINTAINER Andrew McDermott <aim@frobware.com>
RUN apt-get update && apt-get -y install --no-install-recommends git gcc mercurial pkg-config libpcre3 libpcre3-dev rpm
RUN mkdir /work /target
WORKDIR /usr/local
ADD installer with-env meta.sh /work/
RUN /work/with-env 'git clone --depth=1 https://github.com/golang/go.git -b ${GO_VERSION} ${GO_VERSION}'
RUN /work/with-env '(cd ${GO_VERSION}/src && ./make.bash)'
ENV GOPATH=/work/gopath
RUN /work/with-env go get -v golang.org/x/tools/cmd/godoc
RUN /work/with-env go get -v github.com/nsf/gocode
RUN /work/with-env 'cp /work/gopath/bin/* ${INSTALL_PREFIX}/${GO_VERSION}/bin'
ADD build-package.bash alternatives-priority /work/
RUN /work/with-env /work/build-package.bash
CMD /work/installer /target
