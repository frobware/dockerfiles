FROM frobware/effing-package-manager
MAINTAINER Andrew McDermott <aim@frobware.com>
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
	    git \
	    gcc \
	    mercurial \
	    pkg-config \
	    libpcre3 \
	    libpcre3-dev \
	    rpm wget
RUN mkdir /work /target
WORKDIR /usr/local
ADD installer with-env build-meta.sh /work/
RUN ls $HOME
RUN wget -q -O go1.4.2.tar.gz https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz; tar -C $HOME -xzf go1.4.2.tar.gz; mv $HOME/go $HOME/go1.4
RUN /work/with-env 'git clone --depth=1 https://github.com/golang/go.git -b ${GO_VERSION} ${GO_VERSION}'
RUN /work/with-env '(cd ${GO_VERSION}/src && ./make.bash)'
ENV GOPATH=/work/gopath
RUN /work/with-env go version
RUN /work/with-env go get -v github.com/nsf/gocode
RUN /work/with-env go get -v golang.org/x/tools/cmd/cover
RUN /work/with-env go get -v golang.org/x/tools/cmd/godoc
ADD build-package.bash package-meta.sh alternatives-priority /work/
RUN /work/with-env /work/build-package.bash
CMD /work/installer /target
