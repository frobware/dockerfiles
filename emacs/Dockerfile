FROM debian:jessie

MAINTAINER Andrew McDermott <aim@frobware.com>

RUN apt-get -yq update && \
    apt-get -yq install \
       emacs24-lucid \
       emacs-goodies-el

ENV APP_DIR=/emacs \
    USER=emacs USER_ID=1000 \
    HOST_GROUP=emacs_${USER} HOST_GID=1001 \
    TERM=xterm256 
    
ENV HOME=/home/${USER}

RUN groupadd --gid "${HOST_GID}" "${HOST_GROUP}"
RUN useradd --create-home --shell /bin/bash --uid "${USER_ID}" --groups "${HOST_GROUP}" "${USER}"
RUN mkdir -m 775 -p ${APP_DIR}
RUN chown -R ${USER}:${USER} ${APP_DIR}

COPY .emacs.d/ ${HOME}/.emacs.d

RUN chown -R ${USER}:${USER} ${HOME}

# This downloads and installs packages from MELPA, et al.
RUN /usr/bin/emacs --daemon --debug

USER ${USER}
VOLUME ${APP_DIR}
WORKDIR ${APP_DIR}

ENTRYPOINT ["/usr/bin/emacs"]
