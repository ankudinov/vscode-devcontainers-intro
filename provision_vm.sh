#!/usr/bin/env bash
set +e

# install docker
curl -fsSL https://get.docker.com | sh
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
# add user to the docker group
sudo usermod -aG docker vagrant
