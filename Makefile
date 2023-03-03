CURRENT_DIR := $(shell pwd)

.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: remote
remote: ## Open VSCode remote SSH to Vagrant VM
	sshpass -p vagrant ssh-copy-id vagrant@192.168.56.56; code --remote ssh-remote+vagrant@192.168.56.56 /vagrant

.PHONY: demo01
demo01: ## Open demo01 repository on the Vargant VM
	sshpass -p vagrant ssh-copy-id vagrant@192.168.56.56; code --remote ssh-remote+vagrant@192.168.56.56 /home/vagrant/demo01

.PHONY: demo02
demo02: ## Open demo02 repository on the Vargant VM
	sshpass -p vagrant ssh-copy-id vagrant@192.168.56.56; code --remote ssh-remote+vagrant@192.168.56.56 /home/vagrant/demo02

.PHONY: demo03
demo03: ## Open demo03 repository on the Vargant VM
	sshpass -p vagrant ssh-copy-id vagrant@192.168.56.56; code --remote ssh-remote+vagrant@192.168.56.56 /home/vagrant/demo03

.PHONY: demo04
demo04: ## Open demo04 repository on the Vargant VM
	sshpass -p vagrant ssh-copy-id vagrant@192.168.56.56; code --remote ssh-remote+vagrant@192.168.56.56 /home/vagrant/demo04

.PHONY: demo05
demo05: ## Open demo05 repository on the Vargant VM
	sshpass -p vagrant ssh-copy-id vagrant@192.168.56.56; code --remote ssh-remote+vagrant@192.168.56.56 /home/vagrant/demo05

.PHONY: demo06
demo06: ## Open demo06 repository on the Vargant VM
	sshpass -p vagrant ssh-copy-id vagrant@192.168.56.56; code --remote ssh-remote+vagrant@192.168.56.56 /home/vagrant/demo06

.PHONY: demo07
demo07: ## Open demo07 repository on the Vargant VM
	sshpass -p vagrant ssh-copy-id vagrant@192.168.56.56; code --remote ssh-remote+vagrant@192.168.56.56 /home/vagrant/demo07
