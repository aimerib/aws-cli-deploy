FROM ruby:2.6.6-slim
# SHELL ["/bin/bash", "-c"]

# Set PATH with EB cli
ENV PATH /usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin:/root/.ebcli-virtual-env/executables:/root/.pyenv/versions/3.7.2/bin
ENV PYENV_BIN=/usr/local/bin/python

# Install dependencies
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
        gnupg2 \
        shared-mime-info

# Install Yarn and node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn nodejs

# Install EB cli
RUN git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git \
        && ./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer

# Install AWS cli

# # installing it from pip3:
# # https://github.com/aws/aws-cli/issues/5262#issue-630949863
# # might be fixed in the near future.

# RUN apt-get install -y python3-setuptools
# RUN pip3 install --user awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
        && unzip awscliv2.zip && ./aws/install

# Install Sentry cli
RUN curl -sL https://sentry.io/get-cli/ | bash
