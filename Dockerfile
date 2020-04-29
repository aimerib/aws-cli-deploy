FROM alpine:latest

RUN \
  apk update && \
  apk add git python gcc py-pip && \
  pip install awsebcli
