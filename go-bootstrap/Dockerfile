FROM golang:1.4.2
MAINTAINER Andrew McDermott <aim@frobware.com>
RUN apt-get update && apt-get -y install --no-install-recommends git gcc mercurial pkg-config libpcre3 libpcre3-dev bzip2
RUN mkdir /work /target
WORKDIR /work
RUN git clone --depth=1 https://github.com/golang/go.git
ADD *.bash installer /work/
CMD /work/build.bash && /work/installer /target
