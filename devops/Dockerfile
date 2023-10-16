FROM totaldebug/debugbox:base

### ---------------
### Package install
### ---------------

ARG TARGETARCH

# Terraform
USER root

RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

RUN gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(cat /etc/os-release | grep VERSION_CODENAME | cut -d'=' -f2) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list


RUN apt update

RUN apt install -y terraform

# Ansible
RUN sudo apt install -y ansible

USER debug