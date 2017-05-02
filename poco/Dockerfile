FROM frobware/buildimage
MAINTAINER Andrew McDermott <aim@frobware.com>

RUN apt-get -y install libpoco-dev

WORKDIR /work
RUN wget -O poco.tar.gz https://github.com/pocoproject/poco/archive/poco-1.7.8p2-release.tar.gz
RUN tar xf poco.tar.gz --strip-components=1
RUN cmake .
RUN make -j $(nproc)

RUN checkinstall -y --pakdir=/ --pkgname=poco --pkgversion=1.7.8 --install=no make install
CMD /work/installer /target
