FROM ubuntu:latest
MAINTAINER Andrew McDermott <aim@frobware.com>

RUN echo 'Acquire::HTTP::Proxy "http://172.17.0.1:3142";' >> /etc/apt/apt.conf.d/01proxy
RUN echo 'Acquire::HTTPS::Proxy "false";' >> /etc/apt/apt.conf.d/01proxy
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

# RUN echo "deb-src http://deb.debian.org/debian jessie main" >> /etc/apt/sources.list
# RUN echo "deb-src http://deb.debian.org/debian jessie-updates main" >> /etc/apt/sources.list
# RUN echo "deb-src http://security.debian.org jessie/updates main" >> /etc/apt/sources.list

RUN sed -i 's/^# deb-src/deb-src/' /etc/apt/sources.list
RUN cat /etc/apt/sources.list

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install eatmydata
RUN DEBIAN_FRONTEND=noninteractive eatmydata apt-get -y install wget build-essential checkinstall ccache
