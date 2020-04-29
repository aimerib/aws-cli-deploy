FROM alpine:latest

RUN apk --no-cache --update add \
        bash \
        less \
        groff \
        jq \
        git \
        gcc \
        curl \
        python \
        py-pip

RUN pip install --upgrade pip \
        awsebcli \
        awscli

ENV PAGER="less"
