#!/usr/bin/env bash
set +e

CEOS_IMAGE="cEOS-lab-4.29.2F.tar"

# install docker
curl -fsSL https://get.docker.com | sh
# add user to the docker group
sudo usermod -aG docker vagrant
# import docker image that must be downloaded from arista.com in advance
docker import /home/vagrant/vscode/gitignored_files/$CEOS_IMAGE ceos-lab:latest
