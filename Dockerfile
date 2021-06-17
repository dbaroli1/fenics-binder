FROM quay.io/fenicsproject/stable:latest

# create user with a home directory
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}
ENV PATH /home/${NB_USER}/.local/bin:${PATH}

# COPY install files since we are installing without pip!
#COPY --from=builder --chown=$NB_UID:$NB_UID /root/.local $HOME/.local

## Declares build arguments

ARG NB_USER

ARG NB_UID

## Copies your repo files into the Docker Container

USER root

COPY . ${HOME}

## Enable this to copy files from the binder subdirectory

## to the home, overriding any existing files.

## Useful to create a setup on binder that is different from a

## clone of your repository

RUN chown -R ${NB_USER} ${HOME}

## Become normal user again

USER ${NB_USER}


#RUN adduser --disabled-password \
#    --gecos "Default user" \
#    --uid ${NB_UID} \
#    ${NB_USER}
WORKDIR ${HOME}
#USER ${USER}

