FROM totaldebug/debugbox:base

### ---------------
### Package install
### ---------------

ARG TARGETARCH

# Terraform
RUN wget "https://releases.hashicorp.com/terraform/1.6.1/terraform_1.6.1_linux_$TARGETARCH.zip" \
    && unzip "terraform_1.6.1_linux_$TARGETARCH.zip" \
    && sudo install terraform /usr/local/bin/ \
    && sudo rm -rf "terraform_1.6.1_linux_$TARGETARCH.zip" terraform

# Ansible
RUN pipx install --include-deps ansible
