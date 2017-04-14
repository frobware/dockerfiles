FROM        ubuntu
MAINTAINER  aim@frobware.com

VOLUME  /var/cache/apt-cacher-ng
RUN     apt-get update && apt-get install -y apt-cacher-ng

EXPOSE  3142

CMD     chmod 777 /var/cache/apt-cacher-ng && \
        /etc/init.d/apt-cacher-ng start && \
        tail -f /var/log/apt-cacher-ng/*

### Build it

# docker build -t cacher:latest .

### Run it

# docker run -d -p 3142:3142 -v /var/log/apt-cacher-ng:/var/log/apt-cache-ng --name cacher cacher:latest

### Observe

# docker logs cacher

### Test it

# docker run --link cacher:cacher -e http_proxy=http://cacher:3142 -ti ubuntu:latest /bin/bash -c 'apt-get update; apt-get install -y python'
