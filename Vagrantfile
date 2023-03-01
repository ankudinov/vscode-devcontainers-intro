Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-22.04"
    config.vm.hostname = "devcontainer-intro"
    config.vm.network "private_network", ip: "192.168.56.56"

    config.vm.provider "virtualbox" do |v|
      v.name = "devcontainer-intro"
      v.memory = 8192
      v.cpus = 4
    end

    config.vm.synced_folder "gitignored_files/", "/home/vagrant/gitignored_files"
    config.vm.synced_folder ".", "/home/vagrant/vscode"
    # run provisioning script
    config.vm.provision "shell", path: "provision_vm.sh"

  end