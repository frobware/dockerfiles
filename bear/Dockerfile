FROM frobware/buildimage
MAINTAINER Andrew McDermott <aim@frobware.com>

WORKDIR /work

RUN eatmydata apt-get -y build-dep bear
RUN wget -O pkg.tar.gz https://github.com/rizsotto/Bear/archive/2.3.4.tar.gz
RUN tar xf pkg.tar.gz --strip-components=1
RUN cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .
RUN make -j $(nproc)

RUN checkinstall -y --pakdir=/ --pkgname=bear --pkgversion=2.3.4 --install=no make install
CMD /work/installer /target
