FROM golang:1.4.2
RUN mkdir /go-tools /target
WORKDIR /go-tools
ADD build-tools.bash installer /go-tools/
RUN /go-tools/build-tools.bash /target
CMD /go-tools/installer
