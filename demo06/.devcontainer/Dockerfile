FROM mcr.microsoft.com/devcontainers/python:0-3.9-bullseye

# install some basic tools inside the container
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    sshpass \
    curl \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# add code tunnels feature
RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz \
    && tar -xf vscode_cli.tar.gz \
    && rm vscode_cli.tar.gz

# switch user to vscode otherwise Ansible will be installed as root
USER vscode
ENV PATH=$PATH:/home/vscode/.local/bin
# install Ansible AVD collection
ENV _AVD_VERSION="3.8.1"
RUN pip3 install "ansible-core>=2.13.1,<2.14.0" \
    && ansible-galaxy collection install arista.avd:==${_AVD_VERSION} \
    && pip3 install -r /home/vscode/.ansible/collections/ansible_collections/arista/avd/requirements.txt

# install the latest containerlab
RUN bash -c "$(curl -sL https://get.containerlab.dev)" -- -v 0.37.1

# add aliases
COPY add_aliases.zshrc /home/vscode/add_aliases.zshrc
RUN cat /home/vscode/add_aliases.zshrc >> /home/vscode/.zshrc \
    && cat /home/vscode/add_aliases.zshrc >> /home/vscode/.bashrc
