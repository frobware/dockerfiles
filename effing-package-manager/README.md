## effing-package-manager Dockerfile

This repository contains **Dockerfile** of [fpm](https://github.com/jordansissel/fpm) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/dockerfile/effing-package-manager/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

This is a base image that makes it easy to create deb or rpm packages of your applications.

### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/frobware/effing-package-manager/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull frobware/effing-package-manager`

   (alternatively, you can build an image from Dockerfile: `docker build -t="effing-package-manager" frobware/effing-package-manager`)

### Usage

    docker run -ti frobware/effing-package-manager
