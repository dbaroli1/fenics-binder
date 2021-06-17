FROM quay.io/fenicsproject/stable:latest

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}

ENV NB_USER jovyan
ENV NB_UID 1000
RUN mkdir /home/${NB_USER}
ENV HOME /home/${NB_USER}

RUN  chown -R ${NB_USER} ${HOME}

USER ${NB_USER}
RUN  pip3 install pip==9.0.1 && \
    pip3 install --no-cache-dir \
         jupyter-rsession-proxy

CMD jupyter notebook --ip 0.0.0.0


#CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
# COPY install files since we are installing without pip!
#COPY --from=builder --chown=$NB_UID:$NB_UID /root/.local $HOME/.local

#ARG NB_USER=fenics
#ARG NB_UID=1000





