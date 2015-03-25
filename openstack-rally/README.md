## Openstack Rally Dockerfile

This repository contains **Dockerfile** of [OpenStack Rally](https://wiki.openstack.org/wiki/Rally/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/dockerfile/openstack-rally/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/frobware/openstack-rally/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull frobware/openstack-rally`

   (alternatively, you can build an image from Dockerfile: `docker build -t="openstack-rally" frobware/openstack-rally`)

### Usage

    docker run -ti frobware/openstack-rally

