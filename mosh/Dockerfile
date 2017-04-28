FROM frobware/buildimage
MAINTAINER Andrew McDermott <aim@frobware.com>

RUN apt-get -y build-dep mosh

WORKDIR /work

RUN wget https://github.com/frobware/mosh/releases/download/pr696/mosh-1.2.6-agent-forwarding.tar.gz
RUN tar xf mosh-1.2.6-agent-forwarding.tar.gz --strip-components=1
RUN ./configure --prefix=/usr && make -j $(nproc)
RUN checkinstall -d2 --pakdir=/ --pkgname=mosh --pkgversion=1.2.6 --install=no make install

CMD /work/installer /target
