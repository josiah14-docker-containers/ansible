FROM alpine:3.7

RUN apk update

RUN \
  apk add \
  gcc \
  alpine-sdk \
  curl \
  openssh-client \
  openssh \
  python-dev \
  python \
  py-boto \
  py-dateutil \
  py-httplib2 \
  py-jinja2 \
  py-paramiko \
  py-pip \
  py-setuptools \
  py-yaml \
  py2-crypto \
  bash \
  tar && \
  sudo pip install --upgrade pip python-keyczar

RUN ssh-keygen -A
RUN ssh-keygen -b 4096 -t rsa -f ~/.ssh/id_rsa -q -N ""
RUN cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys

RUN apk add ansible

RUN rm -rf /var/cache/apk/*

RUN mkdir /etc/ansible/ /ansible
RUN echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts

RUN mkdir -p /ansible/playbooks
WORKDIR /ansible/playbooks

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ENV ANSIBLE_SSH_PIPELINING true
ENV SHELL /bin/bash

RUN echo "set -o vi" > ~/.bashrc

ENTRYPOINT /usr/sbin/sshd && /bin/bash
