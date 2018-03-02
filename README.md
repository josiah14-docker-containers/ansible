# Ansible Docker Container

## About this Container

This container has the bare essentials for using the Core Ansible CLI tools. [Alpine Linux](https://www.alpinelinux.org/about/) was used to keep this container small, neat, and compact.

The website for Ansible can be found [here](https://www.ansible.com/).

## Getting this Container

To download this docker container, issue the command `docker pull josiah14/ansible:<Ansible Version>_rev<Dockerfile Revision #>`, where `<Dockerfile Revision #>` starts at `0`.  For example, to get the first Dockerfile revision of Ansible 2.4.1.0, issue the command `docker pull josiah14/ansible:2.4.1.0_rev0`.

## Running the Container

To run this container and start using Ansible, just issue the following command.

`docker run --rm -it -v $ANSIBLE_PLAYBOOKS_DIR:/ansible/playbooks josiah14/ansible:2.4.1.0_rev0`

## Understanding the Tags format

Tags on this container adhere to the following format: `<Ansible Version>_rev<Dockerfile Revision #>`.  So, for example, tag `2.4.1.0_rev0` means that this tag denotes a Docker container running Ansible version 2.4.1.0, and this is the first revision of the container (`rev1` would be the second revision).
