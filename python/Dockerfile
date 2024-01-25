FROM totaldebug/debugbox:base

### ---------------
### Package install
### ---------------

# Python upgrade
USER root

RUN apt install software-properties-common -y && \
  add-apt-repository ppa:deadsnakes/ppa

RUN apt update && \
    apt install python3.12 && \
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12 

RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.12 2

RUN sudo update-alternatives --config python3

USER debug

# Poetry + NOX
RUN umask 0002 && sudo pip3 install poetry nox-poetry nox