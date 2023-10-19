FROM ubuntu:latest

### Image info
ARG BUILD_DATE
ARG VERSION
LABEL build_version="totaldebug.uk version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="marksie1988"

### makes things work without interaction
ARG DEBIAN_FRONTEND=noninteractive

### ---------------
### Package install
### ---------------
RUN apt update

RUN apt install -y \
        sudo \
        zsh \
        neofetch \
        unzip \
        yadm \
        git \
        python3 \
        python3-sphinx \
        python3-pip \
        nodejs \
        npm \
        curl \
        wget

# Install required dev packages
RUN npm install -g commitizen && \
    python3 -m pip install cookiecutter


### ---------------
### Initialization
### ---------------

# Set timezone
ARG TIMEZONE=Europe/London
RUN apt install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Create & Set user
ARG USERNAME=debug
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -ms /bin/zsh $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

# Get dotfiles
RUN umask 0002 && yadm clone https://github.com/marksie1988/dotfiles.git

ENTRYPOINT [ "/bin/zsh" ]