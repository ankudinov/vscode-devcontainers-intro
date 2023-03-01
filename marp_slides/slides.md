---
marp: true
theme: default
author: Petr Ankudinov
size: 16:9
paginate: true
math: mathjax
style: |
    :root {
        background: #f8f5f2;
    }

    section::after  {
        /* position pagination box */
        box-sizing: border-box;
        left: 0;
        text-align: left;
        padding: 10px;
        padding-left: 30px;
        content: 'Devcontainers Intro / Slide ' attr(data-marpit-pagination);
    }
---

# Intro into VScode Devcontainers for Network Automation <!-- fit -->

<!-- Do not add page number on this slide -->
<!--
_paginate: false
-->

![bg opacity:.8](https://fastly.picsum.photos/id/24/720/576.jpg?hmac=2l2ISqSEDngDB0p1hldccCFV0pcNzfnz3oxZZkJq0AE)

Petr Ankudinov
$~~~~~~~$ EMEA AS
$~~~~~~~$ Feb 2023

---

# About This Slide Deck

- This slide deck is written in [Marp](https://marp.app/)
- Slides are available as presentation-ready HTML and PDF
- A sample Marp deck explaining the syntax and features is available [here](https://github.com/ankudinov/yet-another-marp-deck)
- The root of this repository contains devcontainer required to build slides. Other examples are located in subdirectories and can be started by executing corresponding Makefile shortcut

<!-- Add footer starting from this slide -->
<!--
footer: '$~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$![h:30](https://www.arista.com/assets/images/logo/Arista_Logo.png)'
-->

---

# Session Targets

- This session is not a deep dive into containers or VSCode
- The purpose is to provide minimum inspiration and motivation for network engineers to try devcontainers. WARNING: addiction guaranteed! 🍰
- Following topics will be covered:
  - devcontainer basics
  - building your own "hand-made" devcontainer
  - add Ansible AVD and Containerlab to you devcontainer
  - do some customization
  - create a backdoor from your devcontainer for a POC

---

# Why Devcontainers?

<style scoped>section {font-size: 26px;}</style>

- Every project has dependencies.
- Managing dependencies is hard. Possible issues include, but not limited to: conflicting installations, system path, incorrect versions, etc.
- venv/pyenv and similar tools are often very specialized, provide limited isolation and do not cover all possible dependency issues. For ex. venv/pyenv cover Python only and can be easily broken.
- Containers provide a better way to build a stable environment, but learning barrier is higher.
- Devcontainers provide all advantages of containerized environments with additional advantages:
  - easy to build
  - easy to use
  - very portable

![bg fit opacity:.3](excalidraw/why_devcontainers.png)

---

# Is It Hard to Build a Good Container?

<style scoped>section {font-size: 22px;}</style>

- To build a reasonable container the following steps are usually required:
  - Craft a base Docker file with some essentials
  - Add non-root user, as root can break permissions in certain scenarios
  - The non-root user ID may not match user ID outside of the container. On some operating systems (for ex. RHEL and the family) that can be a serious problem. Find a way to map UID inside the container to the original UID. [Not a trivial task](https://github.com/arista-netdevops-community/avd-quickstart-containerlab/blob/master/.devcontainer/updateUID.Dockerfile)
  - Create an [entrypoint](https://docs.docker.com/engine/reference/builder/#entrypoint). I'm certain everyone has a perfect understanding of this concept. :slightly_smiling_face: Here is a relatively simple [example](https://github.com/arista-netdevops-community/avd-all-in-one-container/blob/master/entrypoint.sh)
  - Take care of transferring your Git credentials, keys, etc. into the container if it was created as interactive
  - Think about security and something else that you'll certainly forget or never have time to start
  - ... and it has to be multi-platform
- Devcontainers are taking care of most of the points mentioned above out of the box 👍 📦

---

# What is VScode Devcontainer?

A picture worth a thousand words. [Source](https://code.visualstudio.com/docs/devcontainers/containers).

![devcontainer architecture](media/architecture-containers.png)

---

# Getting Started

<style scoped>section {font-size: 26px;}</style>

- [VSCode](https://code.visualstudio.com/download)
- Some kind of Docker
  - MacOS ➡️ Docker Desktop
  - Windows ➡️ WSL2 ➕ Docker Desktop
  - Linux ➡️ Docker CE/EE
- Check [VSCode documentation](https://code.visualstudio.com/docs/devcontainers/containers) for the details.
- Remote Development plugin for VSCode (ms-vscode-remote.vscode-remote-extensionpack). Contains:
  - Remote SSH
  - Dev Containers
  - WSL

---

# Vagrant VM

<style scoped>section {font-size: 24px;}</style>

- You can run all the demos locally on your machine if VSCode and Docker are working correctly. Nothing else is required, just open the corresponding demo directory
- The Vagrant VM is provided:
  - To provide consistent demo environment without OS specific challenges
  - To simplify interaction with the lab by relying on make shortcuts to open each demo
- The Vagrant VM requires following to work:
  - [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
  - [Vagrant](https://developer.hashicorp.com/vagrant/tutorials/getting-started/getting-started-install)
- (Optional) Install `sshpass` to simplify interaction with the lab. On MacOS that can be done using [MacPorts](https://www.macports.org/install.php): `sudo port install sshpass`

> Installing all these requirements can be harder than working with devcontainers directly. Feel free to ask questions about optimal setup for your case during or after the session.

---

# First Steps

```bash
# Clone the repository
git clone https://github.com/ankudinov/vscode-devcontainers-intro.git
# Start Vagrant VM
vagrant up
# Initiate VSCode Remote SSH session to the VM
make remote
# You can destroy the lab any time using the following command:
vagrant destroy
```
