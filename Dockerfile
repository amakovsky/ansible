FROM ubuntu:latest
USER root

ENV ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt
RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  apt-add-repository ppa:ansible/ansible && \
  apt-get update && \
  apt-get install -y --force-yes ansible && \
  echo ${vault_pass} > ~/.vault_pass.txt

RUN mkdir /ansible
WORKDIR /ansible