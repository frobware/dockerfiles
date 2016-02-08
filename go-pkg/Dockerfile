FROM frobware/effing-package-manager
MAINTAINER Andrew McDermott <aim@frobware.com>
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
    	    git \
	    gcc \
	    mercurial \
	    pkg-config \
	    libpcre3 \
	    libpcre3-dev \
	    rpm
RUN mkdir /work /target
WORKDIR /usr/local
ADD installer with-env build-meta.sh /work/
RUN /work/with-env 'git clone --depth=1 https://github.com/golang/go.git -b ${GO_VERSION} ${GO_VERSION}'
RUN /work/with-env '(cd ${GO_VERSION}/src && ./make.bash)'
ENV GOPATH=/work/gopath
RUN /work/with-env go version
RUN /work/with-env go get -v github.com/nsf/gocode
RUN /work/with-env go get -v golang.org/x/tools/cmd/cover
#RUN /work/with-env go get -v golang.org/x/tools/cmd/godoc
# RUN /work/with-env go get -v golang.org/x/tools/cmd/oracle
RUN /work/with-env go get -v golang.org/x/tools/cmd/vet
RUN /work/with-env 'ls /work/gopath/bin'
RUN /work/with-env 'cp -v /work/gopath/bin/* ${INSTALL_PREFIX}/${GO_VERSION}/bin'
RUN /work/with-env 'cp -v /work/gopath/src/golang.org/x/tools/cmd/oracle/oracle.el ${INSTALL_PREFIX}/${GO_VERSION}/misc'
ADD build-package.bash package-meta.sh alternatives-priority /work/
RUN /work/with-env /work/build-package.bash
CMD /work/installer /target
