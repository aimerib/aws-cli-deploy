FROM ruby:2.6.6-slim
# SHELL ["/bin/bash", "-c"]

# Set PATH with EB cli
ENV PATH /usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.ebcli-virtual-env/executables:/root/.pyenv/versions/3.7.2/bin
ENV PYENV_BIN=/usr/local/bin/python

# Install dependencies
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && apt-get install -y \
        build-essential \
        zlib1g-dev \
        libssl-dev \
        libncurses-dev \
        libffi-dev \
        libsqlite3-dev \
        libreadline-dev \
        libbz2-dev \
        curl \
        unzip \
        git \
        libpq-dev \
        nodejs

# Install EB cli
RUN git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git \
        && ./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer

# Install AWS cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
        && unzip awscliv2.zip && ./aws/install

# Install Sentry cli
RUN curl -sL https://sentry.io/get-cli/ | bash
