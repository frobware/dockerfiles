FROM frobware/buildimage
MAINTAINER Andrew McDermott <aim@frobware.com>

RUN apt-get -y build-dep global
RUN apt-get -y install checkinstall

RUN mkdir /work /target
ADD installer /work/
WORKDIR /work

RUN wget http://tamacom.com/global/global-6.5.6.tar.gz
RUN tar xf global-6.5.6.tar.gz --strip-components=1
RUN ./configure --prefix=/usr --disable-gtagscscope && make -j $(nproc)
RUN checkinstall -d2 --pakdir=/ --pkgname=global --pkgversion=6.5.6 --install=no make install

CMD /work/installer /target
