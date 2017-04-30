FROM frobware/buildimage
MAINTAINER Andrew McDermott <aim@frobware.com>

RUN apt-get -y install git clang libclang-dev cmake pkg-config bash-completion
RUN git clone -b v2.9 --depth=1 --recursive https://github.com/Andersbakken/rtags.git

WORKDIR /rtags
RUN cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .
RUN make -j $(nproc)

RUN checkinstall -y --pakdir=/ --pkgname=rtags --pkgversion=2.9 --install=no make install
CMD /work/installer /target
