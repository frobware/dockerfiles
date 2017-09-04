FROM ubuntu:xenial
MAINTAINER Andrew McDermott <aim@frobware.com>

WORKDIR /work

RUN apt-get update
RUN apt-get install -y eatmydata
RUN eatmydata apt-get install -y git build-essential cmake automake
RUN eatmydata apt-get build-dep -y znc znc-dev

RUN eatmydata git clone \
    --depth=1 \
    --branch v1.6.5-with-modules \
    --recurse-submodules https://github.com/frobware/znc /work

RUN ./bootstrap.sh
RUN ./configure

RUN make -j $(nproc)
RUN make install

RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /work/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -m -d /znc-data znc
CMD su znc -c 'znc -D -d /znc-data'
