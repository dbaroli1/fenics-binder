FROM quay.io/fenicsproject/stable:latest

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}

# COPY install files since we are installing without pip!
#COPY --from=builder --chown=$NB_UID:$NB_UID /root/.local $HOME/.local

#ARG NB_USER=fenics
#ARG NB_UID=1000

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}


USER ${NB_USER}


WORKDIR ${HOME}

RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook


