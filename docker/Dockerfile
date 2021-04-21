FROM ubuntu:20.04

# install command.
RUN apt-get update && apt-get install -y less vim unzip curl

# install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    bash -c 'echo complete -C '/usr/bin/aws_completer' aws  >> $HOME/.bashrc'

ENV PS1="awscliv2> "

# install terraform.
# https://azukipochette.hatenablog.com/entry/2018/06/24/004354
RUN curl "https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip" -o "terraform.zip" && \
    unzip ./terraform.zip -d /usr/local/bin/

# create workspace.
COPY ./terraform /infra/terraform

# initialize command.
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
COPY ./docker/.aws /infra/.aws
COPY ./docker/init.sh /infra/init.sh
RUN chmod +x /infra/init.sh && /infra/init.sh
