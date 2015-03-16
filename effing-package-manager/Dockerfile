FROM debian:wheezy
MAINTAINER Andrew McDermott <aim@frobware.com>

RUN for i in /usr/bin/apt*; do ln -s /usr/bin/eatmydata /usr/local/bin/$(basename $i); done

RUN apt-get -qq update && \
    apt-get -y install ruby-dev rubygems build-essential && \
    /usr/bin/gem install --verbose fpm
