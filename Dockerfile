FROM quay.io/fenicsproject/stable:latest

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}

ENV NB_USER jovyan
ENV NB_UID 1000
RUN mkdir /home/${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

USER root
RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}

WORKDIR ${HOME}

EXPOSE 8888

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
# COPY install files since we are installing without pip!
#COPY --from=builder --chown=$NB_UID:$NB_UID /root/.local $HOME/.local

#ARG NB_USER=fenics
#ARG NB_UID=1000





