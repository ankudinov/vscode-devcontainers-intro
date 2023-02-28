CURRENT_DIR := $(shell pwd)

.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: remote
remote: ## Open VSCode remote SSH to Vagrant VM
	sshpass -p vagrant ssh-copy-id vagrant@192.168.56.56; code --remote ssh-remote+vagrant@192.168.56.56 /home/vagrant/vscode