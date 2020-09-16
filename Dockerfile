FROM python:slim

ENV PATH /usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.ebcli-virtual-env/executables:/root/.pyenv/versions/3.7.2/bin

RUN apt-get update && apt-get install -y -qq \
        build-essential \
        zlib1g-dev \
        libssl-dev \
        libncurses-dev \
        libffi-dev \
        libsqlite3-dev \
        libreadline-dev \
        libbz2-dev \
        curl \
        git
RUN git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git \
        && ./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer \
        && apt update -yqq \
        && apt install awscli -yqq
