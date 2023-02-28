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
- The root of this repository contains devcontainer required to build slides. Other examples are located in subdirectories and can be started by executing corresponding Makefile shortcuts

<!-- Add footer starting from this slide -->
<!--
footer: '$~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$![h:30](https://www.arista.com/assets/images/logo/Arista_Logo.png)'
-->
---

# Prerequisites

- [Install VSCode](https://code.visualstudio.com/download)
- Get Ubuntu VM with Docker CE installed
  - The VM is only required to provide consistent demos and avoid OS specific challenges. Devcontainers can perfectly work on your laptop directly
  - You can use provided `Vagrantfile` to create VM
    - This requires Vagrant and Virtualbox
    - (Optional) Install `sshpass` to simplify interaction with the lab. On MacOS that can be done using [MacPorts](https://www.macports.org/install.php): `sudo port install sshpass`
- Clone this repository

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

# What is VScode Devcontainer?

A picture worth a thousand words. [Source](https://code.visualstudio.com/docs/devcontainers/containers).

![devcontainer architecture](media/architecture-containers.png)

---

# Getting Started

<style scoped>section {font-size: 26px;}</style>

- VSCode
- Some kind of Docker
  - MacOS ➡️ Docker Desktop
  - Windows ➡️ WSL2 ➕ Docker Desktop
  - Linux ➡️ Docker CE/EE
- Check [VSCode documentation](https://code.visualstudio.com/docs/devcontainers/containers) for the details.
- Remote Development plugin for VSCode (ms-vscode-remote.vscode-remote-extensionpack). Contains:
  - Remote SSH
  - Dev Containers
  - WSL
