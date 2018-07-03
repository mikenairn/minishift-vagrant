# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "public_network"

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    # Turn on promiscuous mode for NIC
    vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]

    {
        "cpuexecutioncap" => "90",
        "memory" => 8192,
        "cpus" => 4}.each { |key, value|
      # Use VBoxManage to customize the VM
      vb.customize ["modifyvm", :id, "--#{key}", value]
    }
  end

  config.vm.provision "shell", path: "./scripts/minishift.sh"
end
