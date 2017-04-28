FROM frobware/buildimage
MAINTAINER Andrew McDermott <aim@frobware.com>

RUN apt-get -y build-dep emacs

WORKDIR /work

RUN wget http://ftpmirror.gnu.org/emacs/emacs-25.2.tar.xz
RUN tar xf emacs-25.2.tar.xz --strip-components=1
RUN ./configure --prefix=/usr && make -j $(nproc)
RUN checkinstall -d2 --pakdir=/ --pkgname=emacs --pkgversion=25.2 --install=no make install

CMD /work/installer /target
