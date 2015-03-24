FROM frobware/effing-package-manager
RUN apt-get update && apt-get -y install git gcc mercurial pkg-config libpcre3 libpcre3-dev
RUN mkdir /work /target
WORKDIR /work
ADD *.bash *.sh /work/
ENV GO_VERSION=go1.4.2
RUN /work/build-release.bash
RUN /work/build-package.bash /target
ADD installer /installer
CMD /installer
